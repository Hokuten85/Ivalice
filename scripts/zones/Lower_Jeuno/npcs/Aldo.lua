-----------------------------------
-- Area: Lower Jeuno
--  NPC: Aldo
-- Involved in Mission: Magicite, Return to Delkfutt's Tower (Zilart)
-- !pos 20 3 -58 245
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local ZilartMission = player:getCurrentMission(ZILART)
    local ZilartStatus = player:getMissionStatus(xi.mission.log_id.ZILART)

    if (player:hasKeyItem(xi.ki.LETTERS_TO_ALDO)) then
        player:startEvent(152)
    elseif (player:getCurrentMission(player:getNation()) == xi.mission.id.nation.MAGICITE and
        player:getMissionStatus(player:getNation()) == 3) then
        player:startEvent(183)
    elseif (ZilartMission == xi.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER and ZilartStatus == 0) then
        player:startEvent(104)
    elseif ZilartMission == xi.mission.id.zilart.THE_SEALED_SHRINE and ZilartStatus == 1 then
        player:startEvent(111);
    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.APOCALYPSE_NIGH) == QUEST_ACCEPTED and
        player:getCharVar('ApocalypseNigh') == 5 and player:getRank() >= 5 then
        player:startEvent(10057)
    elseif player:getCharVar('ApocalypseNigh') == 6 then
        player:startEvent(10058)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 152) then
        player:delKeyItem(xi.ki.LETTERS_TO_ALDO)
        player:addKeyItem(xi.ki.SILVER_BELL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SILVER_BELL)
        player:setMissionStatus(player:getNation(), 3)
    elseif (csid == 104) then
        player:setMissionStatus(xi.mission.log_id.ZILART, 1);
    elseif csid == 10057 then
        player:setCharVar("ApocalypseNigh", 6)
    end
end

return entity
