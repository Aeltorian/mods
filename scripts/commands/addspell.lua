-----------------------------------
-- func: addspell <spellID> <player>
-- desc: adds the ability to use a spell to the player
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = "is"
}

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addspell <spellID> (player)")
end

commandObj.onTrigger = function(player, spellId, target)
    -- validate spellId
    if spellId == nil then
        error(player, "Invalid spellID.")
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- add spell
    local save = true
    local silent = false
    targ:addSpell(spellId, silent, save)
    player:PrintToPlayer(string.format("Added spell %i to %s.", spellId, targ:getName()))
end

return commandObj
