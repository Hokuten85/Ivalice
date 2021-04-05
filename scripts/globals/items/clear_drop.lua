-----------------------------------
--  ID: 4259
--  Item: Clear Drop
--  Intelligence 5
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(tpz.effect.INT_BOOST, 5, 0, 600)
    target:addStatusEffect(tpz.effect.MEDICINE, 0, 0, 3600)
    
    if target:getCharMod(tpz.mod.INT) < 20 then
        target:addCharMod(tpz.mod.INT,1)
    end
end

return item_object
