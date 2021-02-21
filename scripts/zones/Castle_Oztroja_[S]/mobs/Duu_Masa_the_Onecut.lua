-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Duu Masa the Onecut
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 2 to 4 hours
end

return entity
