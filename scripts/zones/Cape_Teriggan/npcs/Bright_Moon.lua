-----------------------------------
-- Area: Cape Teriggan
--  NPC: Bright Moon
-- Type: Outpost Vendor
-- !pos -185 7 -63 113
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

local vendorRegion  = tpz.region.VOLLBOW
local vendorEvent   = 32756

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    tpz.conquest.vendorOnTrigger(player, vendorRegion, vendorEvent)
end

entity.onEventUpdate = function(player, csid, option)
    tpz.conquest.vendorOnEventUpdate(player, vendorRegion)
end

entity.onEventFinish = function(player, csid, option)
    tpz.conquest.vendorOnEventFinish(player, option, vendorRegion)
end

return entity
