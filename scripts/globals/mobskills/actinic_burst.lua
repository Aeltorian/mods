-----------------------------------
-- Actinic Burst
-- Family: Ghrah
-- Description: Greatly lowers the accuracy of enemies within range for a brief period of time.
-- Type: Magical (Light)
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown
-- Notes:
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.FLASH
    local power = 200
    local duration = 20

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, power, 0, duration))

    return typeEffect
end

return mobskillObject
