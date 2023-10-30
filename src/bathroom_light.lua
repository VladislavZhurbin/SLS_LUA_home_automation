-- SB rule: bathroom_light.lua,30.0

local button = Event.State.Value
local current_state = zigbee.value("PTVO_4", "state_l2") -- master button
--local device = Event.FriendlyName
local seconds = 10 --tonumber(Event.Param)

if button == "l1_single" then --[[zigbee.get("PTVO_3", "state_l3") == true and ]]
    print("Pressed bathroom's button light")
    if zigbee.get("PTVO_4", "state_l2") == true and current_state == "ON" then -- check current state of master button
        -- relay turn OFF light itselves             
        local state_bath_light = zigbee.value("PTVO_3", "state_l3")
        if state_bath_light == "ON" then  -- if bathroom light is ON then
            zigbee.set("PTVO_3", "state_l3", "OFF") -- turn OFF bathroom light
            zigbee.get("PTVO_3", "state_l3")
            local state_vent = zigbee.value("PTVO_2", "state_l1")
            if (state_vent == "ON" --[[and scripts.getTimer("off_vent") > os.time()]]) then -- if state_l3 was turned on by turning off state_l5 with the timer started, the timer is restarted; without the second condition "scripts.getTimer()" state_l6 is turned off by the timer when it was turned on with l6_single
                scripts.setTimer("off_vent", os.time() + seconds)
                print("Remain seconds: ", scripts.getTimer("off_vent"))
            elseif (state_vent == "OFF") then
                zigbee.set("PTVO_2", "state_l1", "TOGGLE") -- turn ON vent
                zigbee.get("PTVO_2", "state_l1")
                scripts.setTimer("off_vent", os.time() + seconds)
                print("Remain seconds: ", scripts.getTimer("off_vent"))
            end
        elseif state_bath_light == "OFF" then  -- if bathroom light is OFF then
            zigbee.set("PTVO_3", "state_l3", "ON") -- turn ON bathroom light
            zigbee.get("PTVO_3", "state_l3")
        end
    else
        print("Error: master button is off")
    end
end