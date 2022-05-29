----------------------------------------------------
-- utilities
----------------------------------------------------
local logger = hs.logger.new('dotfiles','info')

local function press(mods, key)
  if key == nil then
    key = mods
    mods = {}
  end

  return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

local function remap(mods, key, press)
  hs.hotkey.bind(mods, key, press, nil, press)
end
----------------------------------------------------
-- reload
----------------------------------------------------
hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
  hs.reload()
end)
----------------------------------------------------
-- keymap for arrows
----------------------------------------------------
remap({'alt'}, 'h', press('left'))
remap({'alt'}, 'j', press('down'))
remap({'alt'}, 'k', press('up'))
remap({'alt'}, 'l', press('right'))
----------------------------------------------------
-- focus on next window
----------------------------------------------------
remap({'cmd'}, 'escape', press({'cmd'}, '`'))
----------------------------------------------------
-- keymap for media control
----------------------------------------------------
hs.hotkey.bind({"alt"}, "z", function()
  hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post()
  hs.eventtap.event.newSystemKeyEvent('PREVIOUS', false):post()
end)
hs.hotkey.bind({"alt"}, "x", function()
  hs.eventtap.event.newSystemKeyEvent('PLAY', true):post()
  hs.eventtap.event.newSystemKeyEvent('PLAY', false):post()
end)
hs.hotkey.bind({"alt"}, "c", function()
  hs.eventtap.event.newSystemKeyEvent('NEXT', true):post()
  hs.eventtap.event.newSystemKeyEvent('NEXT', false):post()
end)
----------------------------------------------------
-- low battery alert
----------------------------------------------------
local lowBatteryTimer = hs.timer.doEvery(60, function()
  local pct = hs.battery.percentage()
  logger.i('battery level ' .. pct .. '%')
  if pct <= 25 then
    hs.alert.show('low battery ' .. pct .. '%')
  end
end)
----------------------------------------------------
-- caffeine
----------------------------------------------------
local caffeine = hs.menubar.new()
local function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle('+')
    else
        caffeine:setTitle('-')
    end
end

local function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle('displayIdle'))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get('displayIdle'))
end
----------------------------------------------------
-- watcher
----------------------------------------------------
hs.caffeinate.watcher.new(function(_)
  keyboardEventTap:start()
  lowBatteryTimer:start()
end):start()
