GameOverScene = Scene:new({
  name = 'gameOver',
  finalScore = 0,
  init = function(_ENV, score)
    finalScore = score
  end,
  update = function(_ENV)
    if btnp(4) then
      sfx(3)
      return 'game'
    elseif btnp(5) then
      sfx(3)
      return 'title'
    end
    return 'gameOver'
  end,
  draw = function(_ENV)
    cls()
    print('game over', 40, 40, 7)
    print('final score ' .. finalScore, 32, 56, 7)
    print('press 🅾️ to restart', 22, 64, 7)
    print('press ❎ for title screen', 10, 72, 7)
  end
})