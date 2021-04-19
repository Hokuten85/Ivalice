-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 809, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 810, 1, xi.regime.type.GROUNDS)
end

return entity
