-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Five of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 664, 1, xi.regime.type.GROUNDS)
end

return entity
