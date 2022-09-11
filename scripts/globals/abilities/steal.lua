-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/job_utils/thief")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.thief.checkSteal(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability, action)
    return xi.job_utils.thief.useSteal(player, target, ability, action)
end

return ability_object
