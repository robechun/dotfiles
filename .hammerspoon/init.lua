hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local samsungScreen = hs.screen'C34H'

  local max = samsungScreen:frame()

  local frame = hs.geometry(max.x, 5, max.w, 1450)

  win:move(frame, 0)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
  local win = hs.window.focusedWindow()
  local samsungScreen = hs.screen'C34H'

  local max = samsungScreen:frame()

  local frame = hs.geometry(max.x, 5, max.w, max.h);
  win:setFrame(frame, 0)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- Lower volume to 0 when not in home wifi
wifiWatcher = nil
homeSSID = "Crikey m8-5G"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

