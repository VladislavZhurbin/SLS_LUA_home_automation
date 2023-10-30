local button = Event.State.Value
local current_state = zigbee.value("PTVO_4", "state_l2") -- master button
local device = Event.FriendlyName
local seconds = 900

--local emergency_temperature = 30.00
--local temp_1 = zigbee.value("PTVO_4", "temperature_l7")
--local temp_2 = zigbee.value("PTVO_4", "temperature_l8")


if --[[device == "PTVO_2" and ]](button == "l1_single" or button == "l2_single" or button == "l3_single" or button == "l4_single") then
    if zigbee.get("PTVO_4", "state_l2") == true and current_state == "ON" then -- check current state of master button
    print("Current state = ", current_state)
        local state = zigbee.value("PTVO_1", "state_"..button:sub(1,2))
        if --[[zigbee.get("PTVO_4", "state_l2") == true and]] state == "ON" then
            zigbee.set("PTVO_1", "state_"..button:sub(1,2), "OFF")
            zigbee.get("PTVO_1", "state_"..button:sub(1,2))
            if (button:sub(1,2) == "l3") then
                local state_vent = zigbee.value("PTVO_2", "state_l1")
                if (state_vent == "ON" --[[and scripts.getTimer("off_vent") > os.time()]]) then -- if state_l3 was turned on by turning off state_l5 with the timer started, the timer is restarted; without the second condition "scripts.getTimer()" state_l6 is turned off by the timer when it was turned on with l6_single
                    scripts.setTimer("off_vent", os.time() + seconds)
                    print("Remain seconds: ", scripts.getTimer("off_vent"))
                elseif (state_vent == "OFF") then
                    zigbee.set("PTVO_2", "state_l1", "ON") -- turn ON vent
                    zigbee.get("PTVO_2", "state_l1")
                    scripts.setTimer("off_vent", os.time() + seconds)
                    print("Remain seconds: ", scripts.getTimer("off_vent"))
                end
            end
        elseif --[[zigbee.get("PTVO_4", "state_l2") == true and ]]state == "OFF" then
            zigbee.set("PTVO_1", "state_"..button:sub(1,2), "ON")
            zigbee.get("PTVO_1", "state_"..button:sub(1,2))
        end
    end
end
