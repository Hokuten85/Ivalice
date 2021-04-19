-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Volcanic Gas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 755, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 756, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 757, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 758, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 759, 1, xi.regime.type.GROUNDS)
end

return entity
