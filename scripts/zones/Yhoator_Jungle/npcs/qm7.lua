-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (Beastmen Treasure qm7/chest3)
-- !pos 205.932 -1.097 -174.886 124
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/beastmentreasure")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    tpz.bmt.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY, ID.npc.BEASTMEN_TREASURE)
end

entity.onTrade = function(player, npc, trade)
    tpz.bmt.handleQmOnTrade(player, npc, trade, ID.npc.BEASTMEN_TREASURE)
end

entity.onEventFinish = function(player, csid)
    tpz.bmt.handleQmOnEventFinish(player, csid)
end

return entity
