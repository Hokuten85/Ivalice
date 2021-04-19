-----------------------------------
-- Area: Inner Horutoto Ruins
--   NM: Maltha
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 288)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 1 to 2 hours
end

return entity
