-----------------------------------
-- Area: RuAun_Gardens
--  NPC: HomePoint#1
-- !pos 5 -42 526 130
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------
local entity = {}

local hpEvent = 8700
local hpIndex = 59

entity.onTrigger = function(player, npc)
    xi.homepoint.onTrigger(player, hpEvent, hpIndex)
end

entity.onEventUpdate = function(player, csid, option)
    xi.homepoint.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.homepoint.onEventFinish(player, csid, option, hpEvent)
end

return entity
