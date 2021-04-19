-----------------------------------
-- Area: Sauromugue Champaign [S]
--   NM: Herensugue
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 90) -- "Triple Attacks almost every round"
    mob:addMod(xi.mod.REGAIN, 75) -- "appears to have a high rate of Regain"
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 531)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 2 to 4 hours
end

return entity
