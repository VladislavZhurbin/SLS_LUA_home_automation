-- SB rule: overheat.lua,60.0

local emergency_temperature = tonumber(Event.Param)
local temp_1 = zigbee.value("PTVO_4", "temperature_l7") 
local temp_2 = zigbee.value("PTVO_4", "temperature_l8")

function overheat(emergency_temperature, temp_1, temp_2)
    if (temp_1 >= emergency_temperature or temp_2 >= emergency_temperature) then
        print("Temperature = "..temp_1.."°C and "..temp_2.."°C")
        scripts.run("power_off")
        telegram.send("Критическая температура датчик 1: ".. temp_1.."°C и датчик 2: ".. temp_2.."°C")
    end
end

function checkDifference(temp_1, temp_2)
    diff = math.abs(temp_1 - temp_2)  -- Calculate the difference between temp_1 and temp_2
    if diff > 1 then                -- Check if the difference is greater than 3
        print("Check temp sensors, difference of temperature sensors values is "..diff.."°C.")
        telegram.send("Разница температур аварийных датчиков ".. diff .."°C. Проверьте и при необходимости замените датчики.")
    end
end

checkDifference(temp_1, temp_2)
overheat(emergency_temperature, temp_1, temp_2)