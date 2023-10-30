local button = Event.State.Value
local current_state = zigbee.value("PTVO_4", "state_l2") -- master button

if zigbee.get("PTVO_4", "state_l2") == true and button == "l2_double" then
    if current_state == "ON" then
        -- The master button is pressed and all power loads are disconnected
        scripts.run("power_off")
        scripts.run("close_water_valves.lua")
        scripts.setTimer("off_vent", 0)
    elseif current_state == "OFF" then
        scripts.run("power_on")
        scripts.run("open_water_valves")
    end
elseif zigbee.get("PTVO_4", "state_l2") == true and button == "l2_single" then
    if current_state == "ON" then
        local state = zigbee.value("PTVO_3", "state_l1")
        if zigbee.get("PTVO_3", "state_l1") == true and state == "ON" then
            zigbee.set("PTVO_3", "state_l1", "OFF")   
            zigbee.get("PTVO_3", "state_l1")
        elseif zigbee.get("PTVO_3", "state_l1") == true and state == "OFF" then
            zigbee.set("PTVO_3", "state_l1", "ON")   
            zigbee.get("PTVO_3", "state_l1")
        end   
    end
end