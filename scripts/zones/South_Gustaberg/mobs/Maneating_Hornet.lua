-----------------------------------
-- Area: South Gustaberg
--  Mob: Maneating Hornet
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 76, 1, xi.regime.type.FIELDS)
end

return entity
