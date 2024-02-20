SettingsScene = Scene:new({
  name = 'settings',
  init = function(_ENV)
  end,
  update = function(_ENV)
    if btnp(4) then
      return 'title'
    elseif btnp(5) then
      return 'title'
    end
    return 'settings'
  end,
  draw = function(_ENV)
    cls()
    print('settings', 40, 40, 7)
  end
})