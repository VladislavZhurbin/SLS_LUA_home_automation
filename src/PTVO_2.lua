local button = Event.State.Value
local current_state = zigbee.value("PTVO_4", "state_l2") -- master button
local device = Event.FriendlyName
--local seconds = 10

--local emergency_temperature = 30.00                      -- think about transfer parameter from overheat.lua
--local temp_1 = zigbee.value("PTVO_4", "temperature_l7")     -- think about transfer parameter from overheat.lua 
--local temp_2 = zigbee.value("PTVO_4", "temperature_l8")


if zigbee.get("PTVO_4", "state_l2") == true and current_state == "ON" then
    if --[[device == "PTVO_2" and ]](button == "l1_single" or button == "l2_single" or button == "l3_single" or button == "l4_single") then
        local state = zigbee.value("PTVO_2", "state_"..button:sub(1,2))
        if --[[zigbee.get("PTVO_4", "state_l2") == true and]] state == "ON" then
            zigbee.set("PTVO_2", "state_"..button:sub(1,2), "OFF")
            zigbee.get("PTVO_2", "state_"..button:sub(1,2))
            if (button:sub(1,2) == "l1") then
                scripts.setTimer("off_vent", 0)
            end
        elseif --[[zigbee.get("PTVO_4", "state_l2") == true and ]]state == "OFF" then
            zigbee.set("PTVO_2", "state_"..button:sub(1,2), "ON")
            zigbee.get("PTVO_2", "state_"..button:sub(1,2))
        end
    end
end