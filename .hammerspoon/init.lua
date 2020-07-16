----------------------------------------------------
-- reload
----------------------------------------------------
hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
  hs.reload()
end)
----------------------------------------------------
-- remap arrow keys
----------------------------------------------------
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

remap({'ctrl'}, 'h', press('left'))
remap({'ctrl'}, 'j', press('down'))
remap({'ctrl'}, 'k', press('up'))
remap({'ctrl'}, 'l', press('right'))

remap({'ctrl', 'shift'}, 'h', press({'shift'}, 'left'))
remap({'ctrl', 'shift'}, 'j', press({'shift'}, 'down'))
remap({'ctrl', 'shift'}, 'k', press({'shift'}, 'up'))
remap({'ctrl', 'shift'}, 'l', press({'shift'}, 'right'))

remap({'ctrl', 'cmd'}, 'h', press({'cmd'}, 'left'))
remap({'ctrl', 'cmd'}, 'j', press({'cmd'}, 'down'))
remap({'ctrl', 'cmd'}, 'k', press({'cmd'}, 'up'))
remap({'ctrl', 'cmd'}, 'l', press({'cmd'}, 'right'))

remap({'ctrl', 'alt'}, 'h', press({'alt'}, 'left'))
remap({'ctrl', 'alt'}, 'j', press({'alt'}, 'down'))
remap({'ctrl', 'alt'}, 'k', press({'alt'}, 'up'))
remap({'ctrl', 'alt'}, 'l', press({'alt'}, 'right'))

remap({'ctrl', 'shift', 'cmd'}, 'h', press({'shift', 'cmd'}, 'left'))
remap({'ctrl', 'shift', 'cmd'}, 'j', press({'shift', 'cmd'}, 'down'))
remap({'ctrl', 'shift', 'cmd'}, 'k', press({'shift', 'cmd'}, 'up'))
remap({'ctrl', 'shift', 'cmd'}, 'l', press({'shift', 'cmd'}, 'right'))

remap({'ctrl', 'shift', 'alt'}, 'h', press({'shift', 'alt'}, 'left'))
remap({'ctrl', 'shift', 'alt'}, 'j', press({'shift', 'alt'}, 'down'))
remap({'ctrl', 'shift', 'alt'}, 'k', press({'shift', 'alt'}, 'up'))
remap({'ctrl', 'shift', 'alt'}, 'l', press({'shift', 'alt'}, 'right'))

remap({'ctrl', 'cmd', 'alt'}, 'h', press({'cmd', 'alt'}, 'left'))
remap({'ctrl', 'cmd', 'alt'}, 'j', press({'cmd', 'alt'}, 'down'))
remap({'ctrl', 'cmd', 'alt'}, 'k', press({'cmd', 'alt'}, 'up'))
remap({'ctrl', 'cmd', 'alt'}, 'l', press({'cmd', 'alt'}, 'right'))

remap({'ctrl', 'cmd', 'alt', 'shift'}, 'h', press({'cmd', 'alt', 'shift'}, 'left'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'j', press({'cmd', 'alt', 'shift'}, 'down'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'k', press({'cmd', 'alt', 'shift'}, 'up'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'l', press({'cmd', 'alt', 'shift'}, 'right'))
----------------------------------------------------
-- focus on next window
----------------------------------------------------
remap({'cmd'}, 'escape', press({'cmd'}, '`'))
----------------------------------------------------
-- swap backspace and backslash
----------------------------------------------------
local tap = hs.eventtap.new(
  {hs.eventtap.event.types.keyDown},
  function(event)
    -- type of macbook internal keyboard
    if event:getProperty(hs.eventtap.event.properties.keyboardEventKeyboardType) == 58 then
      if event:getKeyCode() == hs.keycodes.map['delete'] then
        event:setKeyCode(hs.keycodes.map['\\'])
        return false
      end
      if event:getKeyCode() == hs.keycodes.map['\\'] then
        event:setKeyCode(hs.keycodes.map['delete'])
        return false
      end
    end
    return false
  end
):start()
hs.timer.doEvery(4, function ()
  if not tap:isEnabled() then
    tap:start()
  end
end);
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
-- low battery alert
----------------------------------------------------
hs.timer.doEvery(60, function ()
  local pct = hs.battery.percentage()
  if pct <= 10 then
    hs.alert.show('low battery ' .. pct .. '%')
  end
end);
