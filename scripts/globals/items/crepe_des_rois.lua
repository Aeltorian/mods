-----------------------------------
-- ID: 6568
-- Item: Crepe des Rois
-- Food Effect: 30 minutes, all Races
-----------------------------------
-- INT +2
-- MND +2
-- Magic Accuracy +21% (Max. 95)
-- "Magic Def. Bonus" +1
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 6568)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.INT, 2)
    target:addMod(xi.mod.MND, 2)
    target:addMod(xi.mod.FOOD_MACCP, 21)
    target:addMod(xi.mod.FOOD_MACC_CAP, 95)
    target:addMod(xi.mod.MDEF, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.INT, 2)
    target:delMod(xi.mod.MND, 2)
    target:delMod(xi.mod.FOOD_MACCP, 21)
    target:delMod(xi.mod.FOOD_MACC_CAP, 95)
    target:delMod(xi.mod.MDEF, 1)
end

return itemObject
