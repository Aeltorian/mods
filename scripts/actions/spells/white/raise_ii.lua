-----------------------------------
-- Spell: Raise
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if
        target:isAlive() or          -- Can't cast on alive targets.
        target:hasRaiseTractorMenu() -- Raise and tractor menus both block the casting.
    then
        return xi.msg.basic.CANNOT_ON_THAT_TARG
    end

    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:isPC() then
        target:sendRaise(2)
    else
        if target:getName() == 'Prishe' then
            -- CoP 8-4 Prishe
            target:setLocalVar('Raise', 1)
            target:entityAnimationPacket('sp00')
            target:addHP(target:getMaxHP())
            target:addMP(target:getMaxMP())
        end
    end

    spell:setMsg(xi.msg.basic.MAGIC_CASTS_ON)

    return 2
end

return spellObject
