-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Lesath
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.POISON, {power = 20})
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 294)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 1 to 3 hours
end

return entity
