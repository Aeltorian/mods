-----------------------------------
-- ID: 4315
-- Item: Lungfish
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -2
-- Mind 4
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:getRace() ~= xi.race.MITHRA then
        result = xi.msg.basic.CANNOT_EAT
    elseif target:hasStatusEffect(xi.effect.FOOD) or target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD) then
        result = xi.msg.basic.IS_FULL
    end
    if target:getMod(xi.mod.EAT_RAW_FISH) == 1 then
        result = 0
    end
    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4315)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, -2)
    target:addMod(xi.mod.MND, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, -2)
    target:delMod(xi.mod.MND, 4)
end

return itemObject
