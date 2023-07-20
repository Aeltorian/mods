-----------------------------------
-- ID: 5872
-- Dark Adaman Bolt Quiver
-- When used, you will obtain one stack of Dark Adaman Bolts
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addItem(xi.items.DARK_ADAMAN_BOLT, 99)
end

return itemObject
