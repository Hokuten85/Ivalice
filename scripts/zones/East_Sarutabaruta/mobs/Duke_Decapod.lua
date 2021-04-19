-----------------------------------
-- Area: East Sarutabaruta (116)
--   NM: Duke Decapod
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 255)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900)
end

return entity
