-----------------------------------
-- Ability: Diabolic Eye
-- Reduces max. HP, increases accuracy.
-- Obtained: Dark Knight Level 75
-- Recast Time: 0:05:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.DIABOLIC_EYE, player:getMerit(xi.merit.DIABOLIC_EYE), 0, 180)
end

return abilityObject
