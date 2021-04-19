-----------------------------------
-- ID: 15957
-- Iron Musketeer's Quiver
-- When used, you will obtain one Iron Musketeer's Bolt
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

item_object.onItemUse = function(target)
    target:addItem(18739)
end

return item_object
