-----------------------------------
-- Fiery Blast Alt
--
-- Description: Deals fire damage to a single target
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Notes: Used only by Tiamat, Smok and Ildebrann while flying in place of standard attacks
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, xi.element.FIRE, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)
    skill:setMsg(xi.msg.basic.HIT_DMG)
    return dmg
end

return mobskillObject
