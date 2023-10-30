-- open_water_valves.lua
local state = zigbee.value(tostring(Event.ieeeAddr), "water_leak")

if (zigbee.value("Leak_bathroom", "water_leak") or zigbee.value("Leak_kitchen_sink", "water_leak")) then
    telegram.send("Протечка воды не устранена")
    telegram.send("Краны водоснабжения открыть нельзя")
else
    if zigbee.value("PTVO_4", "state_l4") == "OFF" then
        zigbee.set("PTVO_4", "state_l4", "ON")   
        zigbee.get("PTVO_4", "state_l4")
        telegram.send("Краны водоснабжения открыты")
    elseif zigbee.value("PTVO_4", "state_l3") == "ON" then
        telegram.send("Краны водоснабжения уже открыты")
    end   
end