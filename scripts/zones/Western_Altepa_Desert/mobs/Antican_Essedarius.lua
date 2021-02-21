-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Essedarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 134, 2, tpz.regime.type.FIELDS)
end

return entity
