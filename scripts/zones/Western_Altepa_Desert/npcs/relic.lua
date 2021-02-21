-----------------------------------
-- Area: Western Altepa Desert
--  NPC: <this space intentionally left blank>
-- !pos -152 -16 20 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getCharVar("RELIC_IN_PROGRESS") == 18287 and npcUtil.tradeHas(trade, {1451, 1575, 1589, 18287}) then -- currency, shard, necropsyche, stage 4
        player:startEvent(205, 18288)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 205 and npcUtil.giveItem(player, {18288, {1450, 30}}) then
        player:confirmTrade()
        player:setCharVar("RELIC_IN_PROGRESS", 0)
    end
end

return entity
