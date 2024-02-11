GameOverScene = Scene:new({
  name = 'gameOver',
  init = function(_ENV)
  end,
  update = function(_ENV)
    if btnp(4) then
      return 'game'
    end
    return 'gameOver'
  end,
  draw = function(_ENV)
    cls()
    print('Game Over', 40, 40, 7)
    print('Press X to restart', 25, 48, 7)
  end
})