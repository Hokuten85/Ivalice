-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--   NM: Ratatoskr
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 522)
end

return entity
