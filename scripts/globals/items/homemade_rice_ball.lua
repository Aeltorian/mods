-----------------------------------
-- ID: 5224
-- Item: homemade_rice_ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- Dexterity 1
-- Accuracy +12% (cap 80)
-- Attack +10% (cap 40)
-- Ranged Accuracy +12% (cap 80)
-- Ranged Attack +10% (cap 40)
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) then
        result = xi.msg.basic.IS_FULL
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5224)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 1)
    target:addMod(xi.mod.FOOD_ACCP, 12)
    target:addMod(xi.mod.FOOD_ACC_CAP, 80)
    target:addMod(xi.mod.FOOD_ATTP, 10)
    target:addMod(xi.mod.FOOD_ATT_CAP, 40)
    target:addMod(xi.mod.FOOD_RACCP, 12)
    target:addMod(xi.mod.FOOD_RACC_CAP, 80)
    target:addMod(xi.mod.FOOD_RATTP, 10)
    target:addMod(xi.mod.FOOD_RATT_CAP, 40)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 1)
    target:delMod(xi.mod.FOOD_ACCP, 12)
    target:delMod(xi.mod.FOOD_ACC_CAP, 80)
    target:delMod(xi.mod.FOOD_ATTP, 10)
    target:delMod(xi.mod.FOOD_ATT_CAP, 40)
    target:delMod(xi.mod.FOOD_RACCP, 12)
    target:delMod(xi.mod.FOOD_RACC_CAP, 80)
    target:delMod(xi.mod.FOOD_RATTP, 10)
    target:delMod(xi.mod.FOOD_RATT_CAP, 40)
end

return itemObject
