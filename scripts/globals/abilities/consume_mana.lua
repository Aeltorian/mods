-----------------------------------
-- Ability: Consume Mana
-- Converts all MP into damage for the next attack.
-- Obtained: Dark Knight Level 55
-- Recast Time: 1:00 (or next attack)
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
   player:addStatusEffect(xi.effect.CONSUME_MANA, 1, 0, 60)
end

return abilityObject
