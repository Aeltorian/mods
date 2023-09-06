-----------------------------------
-- ID: 5130
-- Item: Tavnazian Goby
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity 4
-- Mind -4
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5130)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 4)
    target:addMod(xi.mod.MND, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 4)
    target:delMod(xi.mod.MND, -4)
end

return itemObject
