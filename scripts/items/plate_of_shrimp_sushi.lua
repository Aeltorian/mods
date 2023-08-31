-----------------------------------
-- ID: 5691
-- Item: plate_of_shrimp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Vitality 1
-- Defense 5
-- Accuracy % 14 (cap 68)
-- Ranged Accuracy % 14 (cap 68)
-- Resist sleep +1
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5691)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, 1)
    target:addMod(xi.mod.DEF, 5)
    target:addMod(xi.mod.FOOD_ACCP, 14)
    target:addMod(xi.mod.FOOD_ACC_CAP, 68)
    target:addMod(xi.mod.FOOD_RACCP, 14)
    target:addMod(xi.mod.FOOD_RACC_CAP, 68)
    target:addMod(xi.mod.SLEEPRES, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, 1)
    target:delMod(xi.mod.DEF, 5)
    target:delMod(xi.mod.FOOD_ACCP, 14)
    target:delMod(xi.mod.FOOD_ACC_CAP, 68)
    target:delMod(xi.mod.FOOD_RACCP, 14)
    target:delMod(xi.mod.FOOD_RACC_CAP, 68)
    target:delMod(xi.mod.SLEEPRES, 1)
end

return itemObject
