-----------------------------------
-- Realmrazer
-- Club weapon skill
-- Skill Level: 357
-- Delivers a seven-hit attack. params.accuracy varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: MND:73~85%
-- 100%TP    200%TP    300%TP
-- .88        .88       .88
-----------------------------------
require("scripts/globals/status")
require("scripts/settings/main")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskill_object = {}

weaponskill_object.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    -- check to see if player has the unlock charvar for this, if not, do no damage.
    local hasMeritWsUnlock = player:getCharVar("hasRealmrazerUnlock")

    if hasMeritWsUnlock ~= 1 then
        player:PrintToPlayer("You don't have this WS unlocked.")
        return
    end

    local params = {}
    params.numHits = 7
    params.ftp100 = 2.0 params.ftp200 = 3.0 params.ftp300 = 4.0
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 + (player:getMerit(xi.merit.REALMRAZER) * 0.17) params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.8 params.acc200= 0.9 params.acc300= 1
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.mnd_wsc = 0.7 + (player:getMerit(xi.merit.REALMRAZER) * 0.03)
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage

end

return weaponskill_object
