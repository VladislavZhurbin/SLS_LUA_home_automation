function power_off()
    print("Turning OFF all states")
    zigbee.set("PTVO_4", "state_l2", "OFF")
    zigbee.get("PTVO_4", "state_l2")
    for i = 1, 4 do
        zigbee.set("PTVO_1", "state_l" .. i, "OFF")
        zigbee.get("PTVO_1", "state_l" .. i)
        zigbee.set("PTVO_2", "state_l" .. i, "OFF")
        zigbee.get("PTVO_2", "state_l" .. i)
        zigbee.set("PTVO_3", "state_l" .. i, "OFF")
        zigbee.get("PTVO_3", "state_l" .. i)
    end
end
  
power_off()