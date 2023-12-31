-----------------------------------
-- Ability: Soul Enslavement
-- Description: Melee attacks absorb target's TP.
-- Obtained: DRK Level 96
-- Recast Time: 01:00:00
-- Duration: 00:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST))
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.SOUL_ENSLAVEMENT, 8, 1, 30)
end

return abilityObject
