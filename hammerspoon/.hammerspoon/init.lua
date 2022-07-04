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

-- Move front & slack windows to positions I like
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
    local slackWin = hs.application.find("slack"):mainWindow()
    local frontWin = hs.application.find("front"):mainWindow()

    local macScreen = hs.screen'Built'
    local macMaxFrame = macScreen:frame()

    local slackRect = hs.geometry(macMaxFrame.x, macMaxFrame.y, macMaxFrame.w - 45, macMaxFrame.h)
    local frontRect = hs.geometry(macMaxFrame.x, macMaxFrame.y + 45, macMaxFrame.w, macMaxFrame.h - 45)

    slackWin:move(slackRect, nil, true, 0)
    slackWin:moveToScreen(macScreen, true, false, 0)

    frontWin:move(frontRect, nil, true, 0)
    frontWin:moveToScreen(macScreen, true, false, 0)

end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- Lower volume to 0 when not in home wifi
wifiWatcher = nil
homeSSID = "👁️🫦👁️"
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

hs.hotkey.bind({}, "F9", function()
    local app = hs.application.get("kitty")
    if app then
        if not app:mainWindow() then
            app:selectMenuItem({"kitty", "New OS window"})
        elseif app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("kitty")
        app = hs.application.get("kitty")
    end
end)
