-----------------------------------
--  ID: 4262
--  Item: Purple Drop
--  Dexterity 5
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if (target:hasStatusEffect(xi.effect.MEDICINE)) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.DEX_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)
    
    if target:getCharMod(xi.mod.DEX) < 20 then
        target:addCharMod(xi.mod.DEX,1)
    end
end

return item_object
