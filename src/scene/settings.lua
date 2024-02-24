SettingsScene = Scene:new({
  name = 'settings',
  timer = 100,
  flowerCnt = 12,
  selected = 0,
  init = function(_ENV)
  end,
  update = function(_ENV)
    if btnp(0) then
      if selected == 0 and timer - 10 >= 10 then
        timer -= 10
        sfx(3)
      elseif selected == 1 and flowerCnt - 1 >= 1 then
        sfx(3)
        flowerCnt -= 1
      else
        sfx(5)
      end
    elseif btnp(1) then
      if selected == 0 and timer + 10 <= 999 then
        timer += 10
        sfx(3)
      elseif selected == 1 and flowerCnt + 1 <= 12 then
        flowerCnt += 1
        sfx(3)
      else
        sfx(5)
      end
    elseif btnp(2) then
      selected = (selected + 1) % 2
      sfx(3)
    elseif btnp(3) then
      selected = (selected - 1) % 2
      sfx(3)
    elseif btnp(4) then
      return 'title'
    elseif btnp(5) then
      return 'title'
    end
    return 'settings'
  end,
  draw = function(_ENV)
    cls()
    print('settings', 45, 32, 7)
    spr(1, 32, 46 + selected * 8)
    print('timer: ' .. timer, 42, 48, 7)
    print('flowers: ' .. flowerCnt, 40, 56, 7)
    print('❎ to go back to title screen', 10, 72, 7)
  end
})