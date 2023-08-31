-----------------------------------
-- ID: 11861
-- hikogami_yukata
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    target:addItem(xi.item.SUPER_SCOOP, 1)
end

return itemObject
