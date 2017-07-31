-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 7
hs.grid.GRIDHEIGHT = 3

-- disable animation
hs.window.animationDuration = 0

-- hotkey mash
local mash   = {"cmd", "ctrl"}
local mash_shift = {"cmd", "ctrl", "shift"}

hs.hotkey.bind(mash_shift, 'M', hs.grid.show)

-- Launch applications
hs.hotkey.bind(mash, 'h', function () hs.application.launchOrFocus("Zulip") end)
hs.hotkey.bind(mash, 'j', function () hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(mash, 'k', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(mash, 'l', function () hs.application.launchOrFocus("Sublime Text") end)

-- Pomodoro module
local pom_period_sec  = 25 * 60
local pom_count       = 1
local pom_is_active        = false
local pom_time_left        = pom_period_sec
local pom_disable_count    = 0

-- update display
local function pom_update_display()
  local time_min = math.floor( (pom_time_left / 60))
  local time_sec = pom_time_left - (time_min * 60)
  local str = string.format ("[%02d:%02d|#%02d]", time_min, time_sec, pom_count)
  pom_menu:setTitle(str)
end

-- stop the clock
local function pom_disable()
  -- disabling pomodoro twice will reset the countdown
  local pom_was_active = pom_is_active
  pom_is_active = false

  if (pom_disable_count == 0) then
    if (pom_was_active) then
      pom_timer:stop()
      hs.application.launchOrFocus("Zulip")
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
      pom_count        = pom_count + 1
      pom_time_left    = pom_period_sec
    else
      local zulip = hs.application.find('Zulip')
      if (zulip ~= nil) then
        zulip:kill()
      end
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
  end

  pom_is_active = true
  pom_timer:start()
end

local function pom_increase()
  if (pom_is_active) then
    pom_time_left = pom_time_left + (5*60)
  else
    pom_period_sec = pom_period_sec + (5*60)
    pom_update_menu()
  end
end

local function pom_decrease()
  if (pom_is_active) then
    if (pom_time_left >= (5*60)) then
      pom_time_left = pom_time_left - (5*60)
    end
  else
    if (pom_period_sec >= (5*60)) then
      pom_period_sec = pom_period_sec - (5*60)
      pom_update_menu()
    end
  end
end

-- init pomodoro
-- pom_create_menu()
-- pom_update_menu()

hs.hotkey.bind(mash, 'u', function() pom_enable() end)
hs.hotkey.bind(mash, 'i', function() pom_disable() end)
hs.hotkey.bind(mash, 'y', function() pom_increase() end)
hs.hotkey.bind(mash, 'o', function() pom_decrease() end)