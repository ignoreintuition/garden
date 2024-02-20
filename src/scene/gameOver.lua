GameOverScene = Scene:new({
  name = 'gameOver',
  finalScore = 0,
  init = function(_ENV, score)
    finalScore = score
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
    print('final score ' .. finalScore, 30, 48, 7)
    print('press o to restart', 25, 56, 7)
  end
})