TitleScene = Scene:new({
  name = 'title',
  flowers = {},
  init = function(_ENV)
    updateFlowers(_ENV)
  end,
  update = function(_ENV)
    if currInterval <= 0 then
      updateFlowers(_ENV)
      currInterval = timerInterval
    end
    currInterval -= 1
    if btnp(4) then
      sfx(3)
      return 'game'
    elseif btnp(5) then
      sfx(3)
      return 'settings'
    end
    return 'title'
  end,

  draw = function(_ENV)
    cls()
    for y = 1, 3 do
      for x = 1, 7 do
        spr(flowers[y][x].src, flowers[y][x].x, flowers[y][x].y)
      end
      rectfill(52, 52, 92, 60, 0)
      print('garden', 61, 54, 7)
      print('a game by ignoreintution', 24, 80, 7)
      print('sound and music by gruber', 23, 88, 7)
      print('press 🅾️ to start', 40, 96, 7)
      print('press ❎ for settings', 32, 104, 7)
    end
  end,
  updateFlowers = function(_ENV)
    for i = 1, 3 do
      flowers[i] = {}
      for j = 1, 7 do
        flowers[i][j] = Flower:new({ src = flr(rnd(12)) + 1, x = (j + 5) * 8 - 4, y = (i + 5) * 8 - 4 })
      end
    end
  end
})