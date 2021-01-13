-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Eight of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 667, 1, tpz.regime.type.GROUNDS)
end

return entity
