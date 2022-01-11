-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Lageegee
-- Type: Assault Mission Giver
-- !pos 120.808 0.161 -30.435
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/assault")
require("scripts/globals/besieged")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

local items =
{
                [1]  = {itemid = xi.items.VISION_EARRING,    price = 1500},
                [2]  = {itemid = xi.items.UNYIELDING_RING,   price = 2500},
                [3]  = {itemid = xi.items.FORTIFIED_CHAIN,   price = 4000},
                [4]  = {itemid = xi.items.RESOLUTE_BELT,     price = 5000},
                [5]  = {itemid = xi.items.BUSHIDO_CAPE,      price = 5000},
                [6]  = {itemid = xi.items.KHANJAR,           price = 7500},
                [7]  = {itemid = xi.items.HOTARUMARU,        price = 7500},
                [8]  = {itemid = xi.items.IMPERIAL_GUN,      price = 7500},
                [9]  = {itemid = xi.items.AMIR_PUGGAREE,     price = 10000},
                [10] = {itemid = xi.items.PAHLUWAN_CRACKOWS, price = 10000},
                [11] = {itemid = xi.items.YIGIT_GOMLEK,      price = 10000},
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local rank = xi.besieged.getMercenaryRank(player)
    local haveimperialIDtag = player:hasKeyItem(xi.ki.IMPERIAL_ARMY_ID_TAG) and 1 or 0
    local assaultPoints = player:getAssaultPoint(xi.assaultUtil.assaultArea.PERIQIA)

    if rank > 0 then
        player:startEvent(276, rank, haveimperialIDtag, assaultPoints, player:getCurrentAssault())
    else
        player:startEvent(282)
    end
end

entity.onEventUpdate = function(player, csid, option)
    local selectiontype = bit.band(option, 0xF)
    if csid == 276 and selectiontype == 2 then
        local item = bit.rshift(option,14)
        local choice = items[item]
        local assaultPoints = player:getAssaultPoint(xi.assaultUtil.assaultArea.PERIQIA)
        local canEquip = player:canEquipItem(choice.itemid) and 2 or 0

        player:updateEvent(0, 0, assaultPoints, 0, canEquip)
    end
end

entity.onEventFinish = function(player, csid, option)
    if csid == 276 then
        local selectiontype = bit.band(option, 0xF)
        if selectiontype == 1 and npcUtil.giveKeyItem(player, xi.ki.PERIQIA_ASSAULT_ORDERS) then
            -- taken assault mission
            player:addAssault(bit.rshift(option, 4))
            player:delKeyItem(xi.ki.IMPERIAL_ARMY_ID_TAG)
            player:addKeyItem(xi.ki.MAP_OF_PERIQIA)
        elseif selectiontype == 2 then
            -- purchased an item
            local item = bit.rshift(option, 14)
            local choice = items[item]
            if choice and npcUtil.giveItem(player, choice.itemid) then
                player:delAssaultPoint(xi.assaultUtil.assaultArea.PERIQIA, choice.price)
            end
        end
    end
end

return entity
