----------------------------------------------------
-- remap arrow keys
----------------------------------------------------
local function pressFn(mods, key)
  if key == nil then
    key = mods
    mods = {}
  end

  return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

local function remap(mods, key, pressFn)
  hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

remap({'ctrl'}, 'h', pressFn('left'))
remap({'ctrl'}, 'j', pressFn('down'))
remap({'ctrl'}, 'k', pressFn('up'))
remap({'ctrl'}, 'l', pressFn('right'))

remap({'ctrl', 'shift'}, 'h', pressFn({'shift'}, 'left'))
remap({'ctrl', 'shift'}, 'j', pressFn({'shift'}, 'down'))
remap({'ctrl', 'shift'}, 'k', pressFn({'shift'}, 'up'))
remap({'ctrl', 'shift'}, 'l', pressFn({'shift'}, 'right'))

----------------------------------------------------
-- swap backspace and backslash
----------------------------------------------------
hs.eventtap.new(
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
