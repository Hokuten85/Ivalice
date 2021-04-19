-----------------------------------
-- Area: Den of Rancor
--  Mob: Demonic Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 801, 1, xi.regime.type.GROUNDS)
end

return entity
