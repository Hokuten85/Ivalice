-----------------------------------
-- Area: The Boyahda Tree
--   NM: Unut
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 359)
end

return entity
