if (Event.State.Value) then
    zigbee.set("0xXXXXXXXXXXXXXXXX", "state", "OFF")
    telegram.send("🆘" .. Event.FriendlyName)
  else
    telegram.send("✅" .. Event.FriendlyName)
  end