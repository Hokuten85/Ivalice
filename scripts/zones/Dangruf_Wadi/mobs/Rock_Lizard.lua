-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Rock Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 639, 2, tpz.regime.type.GROUNDS)
end

return entity
