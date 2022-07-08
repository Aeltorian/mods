-----------------------------------
-- Blade Shun
-- Katana weapon skill
-- Skill level: N/A
-- Description: Delivers a fivefold attack. Attack power varies with TP.
-- In order to obtain Blade: Shun the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit params.ftp is duplicated for all additional hits.
-- Alignet with the Flame Gorget, Light Gorget & Thunder Gorget.
-- Alignet with the Flame Belt, Light Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Fusion/Impaction
-- Modifiers: DEX:73~85%, depending on merit points upgrades.
-- Damage Multipliers by TP:
-- 100%        200%      300%
-- 0.6875    0.6875      0.6875
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
	    hasMeritWsUnlock = player:getCharVar("hasBladeShunUnlock")
	end

    if hasMeritWsUnlock ~= 1 then
        player:PrintToPlayer("You don't have this WS unlocked.")
        return
    end

    local params = {}
    params.numHits = 5
    params.ftp100 = 2.6875 params.ftp200 = 2.6875 params.ftp300 = 2.6875
    params.str_wsc = 0.0 params.dex_wsc = player:getMerit(xi.merit.BLADE_SHUN) * 0.17 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
        params.dex_wsc = 0.7 + (player:getMerit(xi.merit.BLADE_SHUN) * 0.03)
        params.atk100 = 1.0 params.atk200 = 2.0 params.atk300 = 3.0 -- http://wiki.ffo.jp/html/25610.html
        params.multiHitfTP = true -- https://www.bg-wiki.com/ffxi/Blade:_Shun
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskill_object
