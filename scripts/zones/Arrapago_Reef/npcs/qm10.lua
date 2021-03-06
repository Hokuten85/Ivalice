-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (H-10 / PUP boat)
-- Involved in quests: "No Strings Attached"
-- !pos 457.128 -8.249 60.795 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCharVar("NoStringsAttachedProgress") == 3 then
        player:startEvent(214)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 214 then
        npcUtil.giveKeyItem(player, xi.ki.ANTIQUE_AUTOMATON)
        player:setCharVar("NoStringsAttachedProgress", 4)
    end
end

return entity
