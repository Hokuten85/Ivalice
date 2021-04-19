-----------------------------------
--
-- Zone: Cape_Teriggan (113)
--
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs")
-----------------------------------
require("scripts/quests/i_can_hear_a_rainbow")
require("scripts/globals/conquest")
require("scripts/globals/world")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    local Kreutzet = GetMobByID(ID.mob.KREUTZET)
    UpdateNMSpawnPoint(ID.mob.KREUTZET)
    Kreutzet:setRespawnTime(900) -- 9 to 12 hours
    Kreutzet:setLocalVar("cooldown", os.time() + Kreutzet:getRespawnTime()/1000)
    DisallowRespawn(Kreutzet:getID(), true) -- prevents accidental 'pop' during no wind weather and immediate despawn

    xi.conq.setRegionalConquestOverseers(zone:getRegionID())
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos( 315.644, -1.517, -60.633, 108)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 2
    end

    return cs
end

zone_object.onRegionEnter = function( player, region)
end

zone_object.onEventUpdate = function( player, csid, option)
    if csid == 2 then
        quests.rainbow.onEventUpdate(player)
    end
end

zone_object.onEventFinish = function( player, csid, option)
end

zone_object.onZoneWeatherChange = function(weather)
    local Kreutzet = GetMobByID(ID.mob.KREUTZET)
    if
        not Kreutzet:isSpawned() and os.time() > Kreutzet:getLocalVar("cooldown")
        and (weather == xi.weather.WIND or weather == xi.weather.GALES)
    then
        DisallowRespawn(Kreutzet:getID(), false)
        Kreutzet:setRespawnTime(math.random(30, 150)) -- pop 30-150 sec after wind weather starts
    end
end

return zone_object
