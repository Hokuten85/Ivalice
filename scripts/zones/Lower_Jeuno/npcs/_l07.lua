-----------------------------------
-- Area: Lower Jeuno
--  NPC: Streetlamp
-- Involved in Quests: Community Service
-- !pos -51 0 -59 245
-----------------------------------
require("scripts/zones/Lower_Jeuno/globals")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    LOWER_JEUNO.lampTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    LOWER_JEUNO.lampEventFinish(player, csid, option, 7)
end

return entity
