-----------------------------------
-- Area: Nyzul Isle
--   NM: Steelfleece Baldarich
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    player:addTitle(tpz.title.THE_HORNSPLITTER)
end

return entity
