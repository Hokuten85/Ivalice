-----------------------------------
-- Area: Caedarva Mire
--   NM: Aynu-kaysey
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/families/qutrub")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 470)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 2 to 4 hours
end