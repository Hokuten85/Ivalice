-----------------------------------
-- Area: East Ronfaure
--  Mob: Cheval Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 64, 1, xi.regime.type.FIELDS)
end

return entity
