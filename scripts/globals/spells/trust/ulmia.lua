-----------------------------------
-- Trust: Ulmia
-----------------------------------
require("scripts/globals/trust")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.PRISHE] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.MILDAURION] = xi.trust.message_offset.TEAMWORK_2,
    })

    -- TODO: BRD trusts need better logic and major overhaul, for now they compliment each other
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MADRIGAL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.MADRIGAL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MINUET, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.VALOR_MINUET)

    mob:SetAutoAttackEnabled(false)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spellObject
