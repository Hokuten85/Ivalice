-----------------------------------
-- Area: Xarcabard [S]
--   NM: Zirnitra
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 543)
end

return entity
