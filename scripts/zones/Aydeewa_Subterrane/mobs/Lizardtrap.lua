-----------------------------------
-- Area: Aydeewa Subterrane
--   NM: Lizardtrap
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE)
end

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 462)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 120 to 130 minutes
end

return entity
