-----------------------------------
--
-- Zone: FeiYin (204)
--
-----------------------------------
local ID = require("scripts/zones/FeiYin/IDs")
require("scripts/globals/conquest")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/treasure")
require("scripts/globals/quests")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    UpdateNMSpawnPoint(ID.mob.CAPRICIOUS_CASSIE)
    GetMobByID(ID.mob.CAPRICIOUS_CASSIE):setRespawnTime(900)

    tpz.treasure.initZone(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local currentMission = player:getCurrentMission(player:getNation())
    local MissionStatus = player:getCharVar("MissionStatus")
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(99.98, -1.768, 275.993, 70)
    end

    if (player:getCharVar("peaceForTheSpiritCS") == 1 and not player:hasItem(1093)) then -- Antique Coin
        SpawnMob(ID.mob.MISER_MURPHY) -- RDM AF
    end

    if (prevZone == tpz.zone.BEAUCEDINE_GLACIER and currentMission == tpz.mission.id.nation.ARCHLICH and MissionStatus == 10) then
        cs = 1 -- MISSION 5-1
    elseif (currentMission == tpz.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT and MissionStatus == 2) then
        cs = 23 -- San d'Oria 9-2
    elseif (player:getCurrentMission(ACP) == tpz.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I) then
        cs = 29
    elseif (prevZone == tpz.zone.QUBIA_ARENA and player:getQuestStatus(tpz.quest.log_id.BASTOK, tpz.quest.id.bastok.THE_FIRST_MEETING) == QUEST_ACCEPTED and not player:hasKeyItem(tpz.ki.LETTER_FROM_DALZAKK)) then
        cs = 16 -- MNK AF
    elseif (prevZone == tpz.zone.BEAUCEDINE_GLACIER and player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.PIEUJE_S_DECISION) == QUEST_ACCEPTED and player:getCharVar("pieujesDecisionCS") == 0) then
        cs = 19 -- WHM AF
    end

    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if (csid == 1) then
        player:setCharVar("MissionStatus", 11)
    elseif (csid == 16) then
        player:addKeyItem(tpz.ki.LETTER_FROM_DALZAKK)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.LETTER_FROM_DALZAKK)
    elseif (csid == 19) then
        player:setCharVar("pieujesDecisionCS", 1)
    elseif (csid == 23) then
        player:setCharVar("MissionStatus", 3)
    elseif (csid == 29) then
        player:completeMission(tpz.mission.log_id.ACP, tpz.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I)
        player:addMission(tpz.mission.log_id.ACP, tpz.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_II)
    end
end

return zone_object
