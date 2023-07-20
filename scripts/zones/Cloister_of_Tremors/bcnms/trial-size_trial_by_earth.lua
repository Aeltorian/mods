-----------------------------------
-- Area: Cloister of Tremors
-- BCNM: Trial-size Trial by Earth
-----------------------------------
local ID = require("scripts/zones/Cloister_of_Tremors/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/quests")
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)
end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)
end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TRIAL_SIZE_TRIAL_BY_EARTH) == QUEST_COMPLETED) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)
end

battlefieldObject.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if not player:hasSpell(xi.magic.spell.TITAN) then
            player:addSpell(xi.magic.spell.TITAN)
            player:messageSpecial(ID.text.TITAN_UNLOCKED, 0, 0, 1)
        end

        if not player:hasItem(xi.items.SCROLL_OF_INSTANT_WARP) then
            player:addItem(xi.items.SCROLL_OF_INSTANT_WARP)
            player:messageSpecial(ID.text.ITEM_OBTAINED, xi.items.SCROLL_OF_INSTANT_WARP)
        end

        player:addFame(xi.quest.fame_area.BASTOK, 30)
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TRIAL_SIZE_TRIAL_BY_EARTH)
    end
end

return battlefieldObject
