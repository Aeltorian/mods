-----------------------------------
-- Stardiver
-- Polearm weapon skill
-- Skill Level: MERIT
-- Delivers a fourfold attack. Damage varies with TP.
-- Will stack with Sneak Attack.     reduces params.crit hit evasion by 5%
-- Element: None
-- Modifiers: STR:73~85%
-- 100%TP    200%TP    300%TP
-- 0.75         1.25       1.75
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskill_object = {}

weaponskill_object.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    -- check to see if player has the unlock charvar for this, if not, do no damage.
    local hasMeritWsUnlock = 1
	
    if player:isPC() then
	    hasMeritWsUnlock = player:getCharVar("hasStardiverUnlock")
	end

    if hasMeritWsUnlock ~= 1 then
        player:PrintToPlayer("You don't have this WS unlocked.")
        return
    end

    local params = {}
    params.numHits = 4
    params.ftp100 = 2.25 params.ftp200 = 2.25 params.ftp300 = 2.25
    params.str_wsc = 0.0 + (player:getMerit(xi.merit.STARDIVER) * 0.17) params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.7 + (player:getMerit(xi.merit.STARDIVER) * 0.03)
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if (damage > 0 and target:hasStatusEffect(xi.effect.CRIT_HIT_EVASION_DOWN) == false) then
        target:addStatusEffect(xi.effect.CRIT_HIT_EVASION_DOWN, 5, 0, 60)
    end
    return tpHits, extraHits, criticalHit, damage

end

return weaponskill_object
