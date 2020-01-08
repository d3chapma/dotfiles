-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 5
hs.grid.GRIDHEIGHT = 3

-- disable animation
hs.window.animationDuration = 0

-- hotkey mash
local mash   = {"cmd", "ctrl"}
local mash_shift = {"cmd", "ctrl", "shift"}

hs.hotkey.bind(mash_shift, 'M', hs.grid.show)

-- Launch applications
hs.hotkey.bind(mash, 'j', function () hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(mash, 'k', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(mash, 'l', function () hs.application.launchOrFocus("Sublime Text") end)
hs.hotkey.bind(mash, 'u', function () hs.application.launchOrFocus("Spotify") end)

-- Pomodoro module
local pom_period_sec       = 20 * 60
local pom_is_active        = false
local pom_time_left        = pom_period_sec
local pom_disable_count    = 0

-- update display
local function pom_update_display()
  local time_min = math.floor( (pom_time_left / 60))
  local time_sec = pom_time_left - (time_min * 60)
  local str = string.format ("[%02d:%02d]", time_min, time_sec)
  pom_menu:setTitle(str)
end

-- stop the clock
local function pom_disable()
  -- disabling timer twice will reset the countdown
  local pom_was_active = pom_is_active
  pom_is_active = false

  if (pom_disable_count == 0) then
    if (pom_was_active) then
      pom_timer:stop()
    end
  elseif (pom_disable_count == 1) then
    pom_time_left = pom_period_sec
    pom_update_display()
  elseif (pom_disable_count >= 2) then
    if pom_menu == nil then
      pom_disable_count = 2
      return
    end
    pom_menu:delete()
    pom_menu = nil
    pom_timer:stop()
    pom_timer = nil
  end

  pom_disable_count = pom_disable_count + 1

end

-- update pomodoro timer
local function pom_update_time()
  if pom_is_active == false then
    return
  else
    pom_time_left = pom_time_left - 1

    if (pom_time_left <= 0 ) then
      pom_disable()
      pom_time_left = pom_period_sec
      hs.dialog.blockAlert("Time's Up!", "")
    end
  end
end

-- update menu display
local function pom_update_menu()
  pom_update_time()
  pom_update_display()
end

local function pom_create_menu(pom_origin)
  if pom_menu == nil then
    pom_menu = hs.menubar.new()
  end
end

local function pom_enable()
  pom_disable_count = 0;
  if (pom_is_active) then
    return
  elseif pom_timer == nil then
    pom_create_menu()
    pom_timer = hs.timer.new(1, pom_update_menu)
    pom_update_display()
  end

  pom_is_active = true
  pom_timer:start()
end

local function pom_increase()
  pom_time_left = pom_time_left + 5 * 60
  pom_update_display()
end

local function pom_decrease()
  pom_time_left = pom_time_left - 5 * 60
  pom_update_display()
end

-- init pomodoro
-- pom_create_menu()
-- pom_update_menu()

hs.hotkey.bind(mash_shift, 'u', function() pom_enable() end)
hs.hotkey.bind(mash_shift, 'p', function() pom_disable() end)
hs.hotkey.bind(mash_shift, 'o', function() pom_increase() end)
hs.hotkey.bind(mash_shift, 'i', function() pom_decrease() end)

local function paste_password()
  hs.eventtap.keyStrokes("Password12345678"):start()
end


local function paste_proxy_host()
  hs.eventtap.keyStrokes("PROXY_HOST=dev.smc:5000 "):start()
end

hs.hotkey.bind(mash_shift, 'y', function() paste_password() end)
hs.hotkey.bind(mash_shift, 'h', function() paste_proxy_host() end)

myKeyStroke = function(modifiers, character)
    local event = require("hs.eventtap").event
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    event.newKeyEvent(modifiers, string.lower(character), false):post()
end

local function forward_word()
  myKeyStroke({"alt"}, "Right")
end

local function backward_word()
  myKeyStroke({"alt"}, "Left")
end

hs.hotkey.bind({"alt"}, 'f', function() forward_word() end)
hs.hotkey.bind({"alt"}, 'b', function() backward_word() end)
