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
    print('game over', 40, 40, 7)
    print('press o to restart', 25, 48, 7)
  end
})