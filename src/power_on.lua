local emergency_temperature = 60.00

local current_state = zigbee.value("PTVO_4", "state_l2") -- master button
local temp_1 = zigbee.value("PTVO_4", "temperature_l7")
local temp_2 = zigbee.value("PTVO_4", "temperature_l8")

if (temp_1 < emergency_temperature and temp_2 < emergency_temperature) then
    if zigbee.get("PTVO_4", "state_l2") == true then
        -- The master button is pressed and contactor of switched-off power loads is enabled
        zigbee.set("PTVO_4", "state_l2", "ON")   
        zigbee.get("PTVO_4", "state_l2")
    end    
else
    print("Danger temperature temp_1 = "..temp_1.."°C and temp_2 = "..temp_2.."°C") --send to telegram
    telegram.send("Критическая температура датчик 1: ".. temp_1.."°C и датчик 2: ".. temp_2.."°C")
    telegram.send("Невозможно включить мастер кнопку")
end