-----------------------------------
-- Ability: Hundred Fists
-- Speeds up attacks.
-- Obtained: Monk Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:45
-----------------------------------
require("scripts/globals/job_utils/monk")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.monk.checkHundredFists(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useHundredFists(player, target, ability)
end

return ability_object
