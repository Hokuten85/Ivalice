-----------------------------------
-- Area: Eastern Altepa Desert (114)
--   NM: Centurio XII-I
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)

    -- Set Centurio XII-I's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900)

end

return entity
