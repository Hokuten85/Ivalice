-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Stroper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 660, 2, tpz.regime.type.GROUNDS)
end

return entity
