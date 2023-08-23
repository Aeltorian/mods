-----------------------------------
-- Garrison
-----------------------------------
require('scripts/globals/common')
require('scripts/globals/npc_util')
require('scripts/globals/garrison_data')
require('scripts/globals/mobs')
require('scripts/globals/npc_util')
require('scripts/globals/pathfind')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
xi.garrison = xi.garrison or {}

xi.garrison.state =
{
    SPAWN_NPCS          = 0,
    BATTLE              = 1,
    SPAWN_MOBS          = 2,
    SPAWN_BOSS          = 3,
    ADVANCE_WAVE        = 4,
    GRANT_LOOT          = 5,
    ENDED               = 6,
}

xi.garrison.tickIntervalMs = 1000

-----------------------------------
-- Helpers: Logging / Messaging
-----------------------------------

-- Prints the given message if DEBUG_GARRISON is enabled
local debugLog = function(msg)
    if xi.settings.main.DEBUG_GARRISON then
        print("[Garrison]: " .. msg)
    end
end

-- Prints the given message with printf if DEBUG_GARRISON is enabled
local debugLogf = function(msg, ...)
    if xi.settings.main.DEBUG_GARRISON then
        printf("[Garrison]: " .. msg, ...)
    end
end

-- Shows the given server message to all players if DEBUG_GARRISON is enabled
local debugPrintToPlayers = function(players, msg)
    if xi.settings.main.DEBUG_GARRISON then
        for _, player in pairs(players) do
            player:PrintToPlayer(msg)
        end
    end
end

-- Sends a message packet to all players
local messagePlayers = function(npc, players, msg)
    for _, player in ipairs(players) do
        player:messageText(npc, msg)
    end
end

-----------------------------------
-- Helpers: Spawning
-----------------------------------

-- Add level restriction effect
-- If a party member is KO'd during the Garrison, they're out.
-- Any players that are KO'd lose their level restriction and will be unable to help afterward.
-- Giving this the CONFRONTATION flag hooks into the target validation systme and stops outsiders
-- participating, for mobs, allies, and players.
xi.garrison.addLevelCap = function(entity, definedCap)
    local cap = definedCap

    -- If this Garrison is uncapped, use the server max (eg. 75)
    if definedCap == 99 then
        cap = xi.settings.main.MAX_LEVEL
    end

    entity:addStatusEffectEx(
        xi.effect.LEVEL_RESTRICTION,
        xi.effect.LEVEL_RESTRICTION,
        cap,
        0,
        0,
        0,
        0,
        0,
        -- Note the level restriction does not wear on death.
        -- Some sources say it does, but we have captures showing otherwise.
        xi.effectFlag.ON_ZONE + xi.effectFlag.CONFRONTATION)
end

-- Randomly assigns aggro between the given groups of entity IDs
xi.garrison.aggroGroups = function(group1, group2)
    for _, entityId1 in pairs(group1) do
        for _, entityId2 in pairs(group2) do
            local entity1 = GetMobByID(entityId1)
            local entity2 = GetMobByID(entityId2)

            if entity1 == nil or entity2 == nil then
                printf("[warning] Could not apply aggro because either %i or %i are not valid entities", entityId1, entityId2)
            else
                debugLogf("Applying enmity: %i <-> %i", entityId1, entityId2)
                entity1:addEnmity(entity2, math.random(1, 5), math.random(1, 5))
                entity2:addEnmity(entity1, math.random(1, 5), math.random(1, 5))
            end
        end
    end
end

-- Spawns and npc for the given zone and with the given name, look, pose
-- Uses dynamic entities
xi.garrison.spawnNPC = function(zone, zoneData, pos, name, groupId, look)
    local mob = zone:insertDynamicEntity({
        objtype     = xi.objType.MOB,
        allegiance  = xi.allegiance.PLAYER,
        name        = name,
        x           = pos[1],
        y           = pos[2],
        z           = pos[3],
        rotation    = pos[4],
        look        = look,
        groupId     = groupId,
        groupZoneId = xi.zone.GM_HOME,

        releaseIdOnDisappear = true,
        specialSpawnAnimation = true,
    })

    -- Use the mob object as you normally would
    mob:setSpawn(pos[1], pos[2], pos[3], pos[4])
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)
    mob:setRoamFlags(xi.roamFlag.SCRIPTED)

    mob:spawn()

    DisallowRespawn(mob:getID(), true)
    mob:setSpeed(25)
    mob:setAllegiance(1)

    -- NPCs don't cast spells or use TP skills
    mob:setMagicCastingEnabled(false)
    mob:setMobAbilityEnabled(false)

    -- Death listener for tracking win/lose condition
    mob:addListener("DEATH", "GARRISON_NPC_DEATH", function(mobArg)
        zoneData.deadNPCCount = zoneData.deadNPCCount + 1
    end)

    return mob
end

local nationName =
{
    [xi.nation.SANDORIA] = "San d'Oria",
    [xi.nation.BASTOK]   = "Bastok",
    [xi.nation.WINDURST] = "Windurst",
    [xi.nation.BEASTMEN] = "Beastmen",
    [xi.nation.OTHER]    = "Other",
}

xi.garrison.getAllyInfo = function(zoneID, zoneData, nationID)
    -- Get zone garrison data
    local allyName    = xi.garrison.allyNames[zoneData.levelCap][nationID]
    local allyLooks   = xi.garrison.allyLooks[zoneData.levelCap][nationID]
    local allyGroupId = xi.garrison.allyGroupIds[zoneData.levelCap]
    local pos         = xi.garrison.zoneData[zoneID].pos

    if
        allyName    == nil or
        allyGroupId == nil or
        allyLooks   == nil or
        #allyLooks  == 0   or
        pos         == nil
    then
        debugLogf("Garrison NPC data missing for %s level %u.", nationName[nationID], zoneData.levelCap)
        return nil
    end

    return {
        name    = allyName,
        looks   = allyLooks,
        groupId = allyGroupId,
        pos     = pos,
    }
end

xi.garrison.rollNPCs = function(zone, allyInfo, quantity)
    local npcs     = {}
    local xPos     = allyInfo.pos[1]
    local yPos     = allyInfo.pos[2]
    local zPos     = allyInfo.pos[3]
    local rot      = allyInfo.pos[4]
    local zoneID   = zone:getID()
    local zoneData = xi.garrison.zoneData[zoneID]

    debugLogf("Spawning %d npcs. GroupId: %d", quantity, allyInfo.groupId)

    for i = 1, quantity do
        table.insert(npcs, {
            name = allyInfo.name,
            look = utils.randomEntry(allyInfo.looks),
            pos  = { xPos, yPos, zPos, rot },
        })

        if i == 6 then
            xPos = allyInfo.pos[1] - zoneData.xSecondLine
            zPos = allyInfo.pos[3] - zoneData.zSecondLine
        elseif i == 12 then
            xPos = allyInfo.pos[1] - zoneData.xThirdLine
            zPos = allyInfo.pos[3] - zoneData.zThirdLine
        else
            xPos = xPos - zoneData.xChange
            zPos = zPos - zoneData.zChange
        end
    end

    return npcs
end

-- Spawns all npcs for the zone in the given garrison starting npc
xi.garrison.spawnNPCs = function(zone, zoneData)
    local zoneID   = zone:getID()
    local nationID = GetRegionOwner(zone:getRegionID())

    if nationID > 2 then
        debugLogf("Region is beastman controlled. Unable to start Garrison.")
        return false
    end

    local allyInfo = xi.garrison.getAllyInfo(zoneID, zoneData, nationID)

    -- If info is missing, a debug message will be logged and NPCs will not be spawned
    if allyInfo == nil then
        return false
    end

    -- Spawn 1 npc per player in alliance
    local npcs = xi.garrison.rollNPCs(zone, allyInfo, #zoneData.players)

    if #npcs == 0 then
        debugLogf("No NPC allies rolled. Unable to start Garrison.")
        return false
    end

    for _, npcData in pairs(npcs) do
        local mob = xi.garrison.spawnNPC(zone, zoneData, npcData.pos, npcData.name, allyInfo.groupId, npcData.look)
        -- Note: This does change the mob level because ally npcs are of type mob, and
        -- level_restriction is only applied to PCs. However, we need the status to validate that the
        -- npcs are part of the garrison.
        -- Because the npcs are not level capped, group ids should be used to define min / max level.
        xi.garrison.addLevelCap(mob, zoneData.levelCap)
        table.insert(zoneData.npcs, mob:getID())
    end

    return true
end

-- Spawns a mob with the given id for the given zone.
xi.garrison.spawnMob = function(mobID, zoneData)
    local mob = SpawnMob(mobID)
    if mob == nil then
        return nil
    end

    xi.garrison.addLevelCap(mob, zoneData.levelCap)
    mob:setRoamFlags(xi.roamFlag.SCRIPTED)
    table.insert(zoneData.mobs, mobID)

    -- Death listener for tracking win/lose condition
    mob:addListener("DEATH", "GARRISON_MOB_DEATH", function(mobArg)
        zoneData.deadMobCount = zoneData.deadMobCount + 1
    end)

    -- A wave is considered complete when all mobs are done despawning
    -- and not just dead. This matters a lot because of spawn timings.
    -- I.e: If mob A dies on wave 1, and another instance of mob A is supposed
    -- to spawn on wave 2, it will not spawn as long as the previous mob is still
    -- despawning
    -- For this reason, we track both death and despawn as separate events
    mob:addListener("DESPAWN", "GARRISON_MOB_DESPAWN", function(mobArg)
        zoneData.despawnedMobCount = zoneData.despawnedMobCount + 1
    end)

    return mob
end

-- Given a starting mobID, return the list of randomly selected
-- mob ids. The amount of mobs selected is determined by numMobs.
-- The ids in the given excludedMobs table will not be included in the result.
-- This method assumes that the mob pool is composed by mobIDs
-- that are sequential between firstMobID and lastMobID
-- e.g: If firstMobId = 1, lastMobID = 4 and numMobs is 2,
-- Then 2 ids randomly selected between { 1, 2, 3, 4 } will be returned
-- without repetitions.
xi.garrison.pickMobsFromPool = function(firstMobID, lastMobID, numMobs, excludedMobIDs)
    -- unfiltered pool, from first to last mob id (inclusive)
    local unfilteredPool = utils.range(firstMobID, lastMobID)

    -- filter the pool, removing excludedMobIDs
    local pool = {}
    local excludedSet = set(excludedMobIDs)

    for _, v in ipairs(unfilteredPool) do
        if not excludedSet[v] then
            table.insert(pool, v)
        end
    end

    -- validate input
    local mobs = {}

    if numMobs > #pool then
        printf("[warning] pickMobsFromPool called with numMobs > mobIds. Num Mobs: %i. Pool size: %i", numMobs, #pool)
        numMobs = #pool
    end

    if numMobs <= 0 then
        printf("[error] Invalid numMobs picked. Should be > 0.")
        return {}
    end

    -- Now we can apply a common algorithm used to "shuffle a deck of cards"
    for i = 1, numMobs do
        -- Pick random index from J to pool end. Add the picked element to result
        local pickedIndex = math.random(i, #pool)

        table.insert(mobs, pool[pickedIndex])

        -- Now swap the picked element with the first element of the array.
        -- This effectively makes the picked element not elegible for future picks.
        pool[pickedIndex], pool[i] = pool[i], pool[pickedIndex]
    end

    return mobs
end

-----------------------------------
-- Main Functions
-----------------------------------

-- Watchdock tick that guarantees our main tick is always running, and if not,
-- stops garrison and clears the invalid state
xi.garrison.watchdog = nil -- prototype
xi.garrison.watchdog = function(npc)
    npc:timer(5000, function(npcArg)
        local zoneData     = xi.garrison.zoneData[npcArg:getZoneID()]
        local tickInterval = 2 * xi.garrison.tickIntervalMs / 1000

        if
            zoneData.isRunning and
            os.time() - zoneData.lastTick > tickInterval
        then
            local zone = npcArg:getZone()
            debugLogf("[error] Invalid garrison state detected for zone: %s. Stopping it now.", zone:getName())
            xi.garrison.stop(zone)
        end

        if zoneData.isRunning then
            xi.garrison.watchdog(npcArg)
        end
    end)
end

-- Main tick that will run the state machine for garrison logic
xi.garrison.tick = nil -- Prototype
xi.garrison.tick = function(npc)
    local zone     = npc:getZone()
    local zoneData = xi.garrison.zoneData[zone:getID()]
    local ID       = zones[npc:getZoneID()]

    local entityMapper = function(_, entityId)
        return GetPlayerByID(entityId)
    end

    local players = utils.map(zoneData.players, entityMapper)

    switch (zoneData.state) : caseof
    {
        [xi.garrison.state.SPAWN_NPCS] = function()
            debugLog("State: Spawn NPCs")
            zoneData.stateTime = os.time()

            if xi.garrison.spawnNPCs(zone, zoneData) then
                zoneData.state = xi.garrison.state.BATTLE
            else
                debugPrintToPlayers(players, "Unable to spawn NPCs")
                zoneData.state = xi.garrison.state.ENDED
            end
        end,

        [xi.garrison.state.BATTLE] = function()
            debugLog("State: Battle")

            -- We do not cache player entity state as they can reraise or DC,
            -- making caching more error prone
            local isAliveFn = function(_, player)
                return player ~= nil and player:isAlive()
            end

            local allPlayersDead = not utils.any(players, isAliveFn)

            -- This caching works because the same mob ID is never used to respawn a mob
            -- within the same wave.
            local allMobsDead      = zoneData.deadMobCount == #zoneData.mobs
            local allMobsDespawned = zoneData.despawnedMobCount == #zoneData.mobs

            -- case 1: Either npcs or players are dead. End event.
            local allNPCsDead = #zoneData.npcs == zoneData.deadNPCCount
            if allNPCsDead or allPlayersDead then
                -- You fought hard, and you proved yourself worthy...
                debugPrintToPlayers(players, "Mission failed by death")
                messagePlayers(npc, players, ID.text.GARRISON_BASE + 39)
                zoneData.state = xi.garrison.state.ENDED
                return
            end

            -- case 2: More mobs to spawn in this wave, and past next spawn time. Spawn Mobs.
            local shouldSpawnMobs = os.time() >= zoneData.nextSpawnTime
            local numGroups       = #zoneData.spawnSchedule[zoneData.waveIndex]
            local isLastGroup     = zoneData.groupIndex > numGroups

            if shouldSpawnMobs and not isLastGroup then
                zoneData.state = xi.garrison.state.SPAWN_MOBS
                return
            end

            -- case 3: All mobs spawned for last wave. Spawn boss
            local numWaves   = #zoneData.spawnSchedule
            local isLastWave = zoneData.waveIndex == numWaves

            if
                shouldSpawnMobs and
                isLastWave and
                isLastGroup and
                not zoneData.bossSpawned
            then
                zoneData.state = xi.garrison.state.SPAWN_BOSS
                return
            end

            -- case 4: All Mobs despawned and this was last group. Check if we advance to next wave
            if
                allMobsDespawned and
                isLastGroup and
                not isLastWave
            then
                zoneData.state = xi.garrison.state.ADVANCE_WAVE
                return
            end

            -- case 5: All mobs are dead and this was last group and last wave. Grant loot.
            if allMobsDead and isLastGroup and isLastWave and zoneData.bossSpawned then
                zoneData.state = xi.garrison.state.GRANT_LOOT
                return
            end

            -- case 6: Timeout
            if os.time() > zoneData.endTime then
                -- You fought hard, and you proved yourself worthy...
                debugPrintToPlayers(players, "Mission failed by timeout")
                messagePlayers(npc, players, ID.text.GARRISON_BASE + 39)

                zoneData.state = xi.garrison.state.ENDED
            end
        end,

        [xi.garrison.state.SPAWN_BOSS] = function()
            debugLog("State: Spawn Boss")
            debugPrintToPlayers(players, "Spawning boss")

            local bossID = zone:queryEntitiesByName(zoneData.mobBoss)[1]:getID()
            local mob = xi.garrison.spawnMob(bossID, zoneData)

            if mob == nil then
                print("[error] Could not spawn boss (%i). Ending garrison.", bossID)
                zoneData.state = xi.garrison.state.ENDED

                return
            end

            xi.garrison.aggroGroups({ bossID }, zoneData.npcs)

            zoneData.bossSpawned = true
            zoneData.state = xi.garrison.state.BATTLE
        end,

        [xi.garrison.state.ADVANCE_WAVE] = function()
            debugLog("State: Advance Wave")
            debugLogf("Wave Idx: %i. Waves: %i", zoneData.waveIndex, #zoneData.spawnSchedule)
            debugLogf("Next wave: %i", zoneData.waveIndex)
            debugPrintToPlayers(players, "Wave " .. zoneData.waveIndex .. " cleared")

            zoneData.waveIndex = zoneData.waveIndex + 1
            zoneData.groupIndex = 1
            zoneData.nextSpawnTime = os.time() + xi.garrison.waves.delayBetweenGroups
            zoneData.state = xi.garrison.state.BATTLE
            zoneData.mobs = {}

            -- reset mob state cache, but not npc since they dont respawn each wave
            zoneData.deadMobCount      = 0
            zoneData.despawnedMobCount = 0
        end,

        [xi.garrison.state.SPAWN_MOBS] = function()
            debugLog("State: Spawn Mobs")

            -- There are always at most 8 mobs + 1 boss for Garrison, so we will look up the
            -- boss's ID using their name and then subtract 8 to get the starting mob ID
            local firstMobID = zone:queryEntitiesByName(zoneData.mobBoss)[1]:getID() - 8

            if zoneData.spawnSchedule[zoneData.waveIndex] == nil then
                printf("[error] No spawn schedule for wave: %d. Num Parties: %d", zoneData.waveIndex, zoneData.numParties)
                zoneData.state = xi.garrison.state.ENDED
                return
            end

            local poolSize = utils.sum(zoneData.spawnSchedule[zoneData.waveIndex], function(_, v)
                return v
            end)

            local numMobs   = zoneData.spawnSchedule[zoneData.waveIndex][zoneData.groupIndex]
            local lastMobID = firstMobID + poolSize - 1

            -- Pick mobs randomly and spawn them
            local mobIDs = xi.garrison.pickMobsFromPool(firstMobID, lastMobID, numMobs, zoneData.mobs)

            for _, mobID in ipairs(mobIDs) do
                xi.garrison.spawnMob(mobID, zoneData)
            end

            -- Once the mobs are spawned, make them aggro whatever NPCs are already up
            -- This method should work fine even if some of these mobs or npcs are invalid / dead
            xi.garrison.aggroGroups(mobIDs, zoneData.npcs)

            debugPrintToPlayers(players, "Spawn: " .. #zoneData.mobs .. "/" .. poolSize .. ". Wave: " .. zoneData.waveIndex)

            zoneData.nextSpawnTime = os.time() + xi.garrison.waves.delayBetweenGroups
            zoneData.state = xi.garrison.state.BATTLE
            zoneData.groupIndex = zoneData.groupIndex + 1
        end,

        [xi.garrison.state.GRANT_LOOT] = function()
            debugLog("State: Grant Loot")
            debugPrintToPlayers(players, "Mission success")
            messagePlayers(npc, players, ID.text.GARRISON_BASE + 36)

            xi.garrison.handleLootRolls(zoneData.levelCap, players)
            xi.garrison.handleGilPayout(zoneData.levelCap, players)

            zoneData.state = xi.garrison.state.ENDED
        end,

        [xi.garrison.state.ENDED] = function()
            debugLog("State: Ended")

            xi.garrison.stop(zone)
        end,
    }

    -- Updates last tick so watchdog knows we are ok
    zoneData.lastTick = os.time()

    -- Keep running tick until done
    if zoneData.isRunning then
        npc:timer(xi.garrison.tickIntervalMs, function(npcArg)
            xi.garrison.tick(npcArg)
        end)
    end
end

xi.garrison.start = function(player, npc)
    local zone             = player:getZone()
    local zoneData         = xi.garrison.zoneData[zone:getID()]
    zoneData.players       = {}
    zoneData.spawnSchedule = xi.garrison.getSpawnSchedule(player)
    zoneData.npcs          = {}
    zoneData.mobs          = {}
    zoneData.state         = xi.garrison.state.SPAWN_NPCS
    zoneData.isRunning     = true
    zoneData.stateTime     = os.time()
    zoneData.waveIndex     = 1
    zoneData.groupIndex    = 1
    zoneData.bossSpawned   = false
    -- First mob spawn takes xi.garrison.waves.delayBetweenGroups to start
    zoneData.nextSpawnTime     = os.time() + xi.garrison.waves.delayBetweenGroups
    zoneData.endTime           = os.time() + xi.settings.main.GARRISON_TIME_LIMIT
    zoneData.deadNPCCount      = 0
    zoneData.deadMobCount      = 0
    zoneData.despawnedMobCount = 0
    zoneData.lastTick          = os.time()

    -- Register lockout for the player
    -- Only the trading player is locked out per tally
    xi.garrison.saveTallyLockout(player)
    -- We register zone lockout at the beginning and end, in case of zone crashes
    xi.garrison.saveZoneLockout(zone)

    -- Adds level cap / registers lockout for the player / zone
    for _, member in pairs(player:getAlliance()) do
        if member:getZoneID() == player:getZoneID() then
            xi.garrison.addLevelCap(member, zoneData.levelCap)

            table.insert(zoneData.players, member:getID())
        end
    end

    -- The starting NPC is the 'anchor' for all timers and logic for this Garrison
    -- Kick off the watchdog to guarantee state consistency
    xi.garrison.watchdog(npc)
    -- Kick off the main tick that drives garrison logic
    xi.garrison.tick(npc)
end

-- Stops and cleans up the current garrison event (if any) on the given zone
-- Can be called externally from GM commands
xi.garrison.stop = function(zone)
    local zoneData = xi.garrison.zoneData[zone:getID()]

    -- Again, we save lockout, this time based off of garrison end time
    xi.garrison.saveZoneLockout(zone)

    for _, entityId in pairs(zoneData.players or {}) do
        local entity = GetPlayerByID(entityId)

        if entity ~= nil then
            entity:delStatusEffect(xi.effect.LEVEL_RESTRICTION)
        end
    end

    for _, entityId in pairs(zoneData.npcs or {}) do
        DespawnMob(entityId, zone)
    end

    for _, entityId in pairs(zoneData.mobs or {}) do
        DespawnMob(entityId, zone)
    end

    zoneData.players       = {}
    zoneData.spawnSchedule = {}
    zoneData.npcs          = {}
    zoneData.mobs          = {}
    zoneData.isRunning     = false
end

xi.garrison.onTrade = function(player, npc, trade, guardNation)
    if not xi.settings.main.ENABLE_GARRISON then
        debugLog("Garrison not enabled. Set ENABLE_GARRISON if desired.")
        return false
    end

    -- Get zone information
    local zone     = player:getZone()
    local zoneID   = zone:getID()
    local nationID = GetRegionOwner(zone:getRegionID())
    local zoneData = xi.garrison.zoneData[zoneID]

    -- If info is missing, a debug message will be logged and Garrison will not begin
    if
        xi.garrison.getAllyInfo(zoneData, nationID) == nil or
        xi.garrison.getMobInfo(zone) == nil
    then
        player:PrintToPlayer("Garrison is currently unavailable for this region.", xi.msg.channel.SYSTEM_3)
        debugLog("Garrison was cancelled due to missing data.")

        return false
    end

    if npcUtil.tradeHasExactly(trade, zoneData.itemReq) then
        if not xi.garrison.validateEntry(zoneData, player, npc, guardNation) then
            debugLog("Player does not meet entry requirements")
            return false
        end

        -- Start CS
        player:startEvent(32753 + player:getNation())
        player:setLocalVar("GARRISON_NPC", npc:getID())

        return true
    end

    return false
end

xi.garrison.onTrigger = function(player, npc)
    if not xi.settings.main.ENABLE_GARRISON then
        return false
    end

    return false
end

xi.garrison.onEventFinish = function(player, csid, option, guardNation, guardType, guardRegion)
    if not xi.settings.main.ENABLE_GARRISON then
        debugLog("Garrison not enabled. Set ENABLE_GARRISON if desired.")
        return false
    end

    if csid == 32753 + player:getNation() and option == 0 then
        player:confirmTrade()

        local npc = GetNPCByID(player:getLocalVar("GARRISON_NPC"))
        xi.garrison.start(player, npc)

        return true
    end

    return false
end

-- Distributes loot amongst all players
-- TODO: Use a central loot system: https://github.com/LandSandBoat/server/issues/3188
xi.garrison.handleLootRolls = function(levelCap, players)
    local lootTable = xi.garrison.loot[levelCap]
    local max       = 0

    for _, entry in ipairs(lootTable) do
        max = max + entry.droprate
    end

    local roll = math.random(max)

    for _, entry in pairs(lootTable) do
        max = max - entry.droprate

        if roll > max then
            if entry.itemid ~= 0 then
                for _, player in ipairs(players) do
                    if player ~= nil then
                        player:addTreasure(entry.itemid)
                        return
                    end
                end
            end

            break
        end
    end
end

xi.garrison.handleGilPayout = function(levelCap, players)
    -- We have two captures at level 30 being rewarded a total of 3k gil.
    -- This is an assumption of how the rest of tiers work.
    local payout = xi.settings.main.GIL_RATE * levelCap * 100 * #players

    debugLog("Payout: " .. payout)

    for _, player in ipairs(players) do
        if player ~= nil then
            local gil = payout / #players
            player:addGil(gil)
            player:messageSpecial(zones[player:getZoneID()].text.GIL_OBTAINED, gil)
        end
    end
end

-- Gets the spawn schedule for the player starting garrison
xi.garrison.getSpawnSchedule = function(player)
    local numParties    = xi.garrison.getNumPartiesInAlliance(player)
    local spawnSchedule = xi.garrison.waves.spawnSchedule[numParties]

    if spawnSchedule == nil then
        -- Leave the log there even if valid most times, because it may help us cause bad use cases
        debugLogf("[warning] Spawn schedule not found for number of parties: %d. Ignore if player has no party.", numParties)
        spawnSchedule = xi.garrison.waves.spawnSchedule[1]
    end

    return spawnSchedule
end

-- Utility function to get the number of parties in the player's alliance
-- This should be moved to utils if we have other files needing the same method
xi.garrison.getNumPartiesInAlliance = function(player)
    local alliance   = player:getAlliance()
    local leaders    = {}
    local numLeaders = 0

    for _, member in pairs(alliance) do
        local leader = member:getPartyLeader()

        if leader ~= nil and not leaders[leader:getName()] then
            numLeaders = numLeaders + 1
            leaders[leader:getName()] = true
        end
    end

    return numLeaders
end

-----------------------------------
-- Entry
-----------------------------------

-- Validates that the player meets the requirements to enter garrison:
-- * Another garrison is not currently active
-- * Outpost is controlled by the player's nation, or GARRISON_NATION_BYPASS setting is true
-- * No player in the alliance (in zone) is level synced
-- * Player hasn't entered garrison since last tally, or GARRISON_ONCE_PER_WEEK setting is false
-- * Player has not finished a garrison since in the last GARRISON_LOCKOUT seconds
-- * Player does not have more than GARRISON_PARTY_LIMIT alliance memebrs
-- * Player is at least at GARRISON_RANK rank level
xi.garrison.validateEntry = function(zoneData, player, npc, guardNation)
    local ID = zones[player:getZoneID()]

    if zoneData.isRunning then
        debugLog("Another garrison in progress")
        player:messageText(npc, ID.text.GARRISON_BASE + 1)

        return false
    end

    local sameZone = function(_, v)
        return (
            v ~= nil and
            v:getZoneID() == player:getZoneID()
        )
    end

    local membersInZone = utils.filterArray(player:getAlliance(), sameZone)

    -- This assumes that only the player trading the item has to be from the right nation
    if
        not xi.settings.main.GARRISON_NATION_BYPASS and
        guardNation ~= player:getNation()
    then
        debugLog("Outpost not controller by player's nation")
        player:messageSpecial(ID.text.GARRISON_BASE + player:getNation(), zoneData.itemReq)

        return false
    end

    local membersLevelRestricted = utils.any(membersInZone, function(_, v)
        return v:isLevelSync()
    end)

    if membersLevelRestricted then
        -- Your party is unable to participate because certain members' levels are restricted
        debugLog("One or more alliance members have level sync on")
        player:messageText(npc, ID.text.MEMBERS_LEVELS_ARE_RESTRICTED, false)

        return false
    end

    if #membersInZone > xi.settings.main.GARRISON_PARTY_LIMIT then
        -- This is a custom message. I don't believe retail has this limitation
        debugLogf("Alliance exceeds member limit: %d", xi.settings.main.GARRISON_PARTY_LIMIT)
        debugPrintToPlayers({ player }, "Maximum garrison alliance size is " .. xi.settings.main.GARRISON_PARTY_LIMIT)

        return false
    end

    -- Only trading player needs to be required rank
    local playerMeetsRank = player:getRank(player:getNation()) >= xi.settings.main.GARRISON_RANK

    if not playerMeetsRank then
        -- These young participants are quite spirited, but they lack valuable battle experience
        debugLogf("Leader does not meet required rank: %d", xi.settings.main.GARRISON_RANK)
        player:messageText(npc, ID.text.GARRISON_BASE + 4)

        return false
    end

    -- Only check tally cooldown for trading player
    if xi.garrison.isPlayerOnTallyLockout(player) then
        -- We commend you on your services in helping us avert the beastmen's attack. I do not see them attacking us again any time soon
        debugLog("Leader is on tally lockout")
        player:messageText(npc, ID.text.GARRISON_BASE + 40)

        return false
    end

    -- Check the "per zone" lockout, applied to all players for the same zone
    if xi.garrison.isZoneOnLockout(player:getZone()) then
        -- We commend you on your services in helping us avert the beastmen's attack. I do not see them attacking us again any time soon
        debugLog("Zone on lockout")
        player:messageText(npc, ID.text.GARRISON_BASE + 40)

        return false
    end

    return true
end

-- Stores the next valid entry time based on next conquest tally
-- This lockout is only for the trading player
xi.garrison.saveTallyLockout = function(player)
    if not xi.settings.main.GARRISON_ONCE_PER_WEEK then
        return
    end

    player:setCharVar("[Garrison]NextEntryTime", getConquestTally())
end

-- Returns true if the given player has entered garrison too recently
-- according to the GARRISON_ONCE_PER_WEEK settings
-- and their last entry time
xi.garrison.isPlayerOnTallyLockout = function(player)
    if not xi.settings.main.GARRISON_ONCE_PER_WEEK then
        return false
    end

    local nextValidAttemptTime = player:getCharVar("[Garrison]NextEntryTime")

    if os.time() < nextValidAttemptTime then
        debugLogf("Cooldown time remaining: %d", nextValidAttemptTime - os.time())
        return true
    end

    return false
end

-- Stores the next valid entry time for the given zone, based on
-- lockout
xi.garrison.saveZoneLockout = function(zone)
    local nextEntryTime = os.time() + xi.settings.main.GARRISON_LOCKOUT
    SetServerVariable("[Garrison]NextEntryTime_" .. zone:getID(), nextEntryTime)
end

-- Returns true if the given zone is still on lockout, based on lockout settings
-- And last entry time of ANY player for this zone
xi.garrison.isZoneOnLockout = function(zone)
    local nextValidAttemptTime = GetServerVariable("[Garrison]NextEntryTime_" .. zone:getID())

    if os.time() < nextValidAttemptTime then
        debugLogf("Zone lockout time remaining: %d", nextValidAttemptTime - os.time())
        return true
    end

    return false
end

-----------------------------------
-- Debugging
-----------------------------------

xi.garrison.win = function(zone)
    local zoneData = xi.garrison.zoneData[zone:getID()]
    zoneData.state = xi.garrison.state.GRANT_LOOT
end
