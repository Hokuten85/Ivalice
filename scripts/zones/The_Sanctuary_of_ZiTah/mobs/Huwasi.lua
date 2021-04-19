-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Huwasi
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 326)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
end

return entity
