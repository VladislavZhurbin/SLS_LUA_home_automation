if zigbee.value("PTVO_2", "state_l1") == "ON" then
    zigbee.set("PTVO_2", "state_l1", "OFF")
    zigbee.get("PTVO_2", "state_l1")
end