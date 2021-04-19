-----------------------------------
-- Area: Northern San d'Oria
--   NPC: Nouveil
-- Type: General
-- !pos 123 0 106 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if (player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.WATER_OF_THE_CHEVAL) == QUEST_ACCEPTED) then
        if (trade:getGil() >= 10) then
            player:startEvent(571)
        end
    end
end

entity.onTrigger = function(player, npc)

    if (player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.WATER_OF_THE_CHEVAL) == QUEST_ACCEPTED) then
        if (player:hasItem(603) == true) then
            player:startEvent(573)
        elseif (player:hasItem(602) == true) then
            player:startEvent(572)
        else
            player:startEvent(575)
        end
    else
        player:startEvent(574)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    -- Waters of the Cheval, recieve blessed waterskin
    if (csid == 571) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 602)
        else
            player:delGil(10)
            player:addItem(602)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 602)
        end
    end
end

return entity
