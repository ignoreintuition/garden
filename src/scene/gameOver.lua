GameOverScene = Scene:new({
  name = 'gameOver',
  finalScore = 0,
  delay = 60,
  init = function(_ENV, score)
    finalScore = score
    timer = 0
  end,
  update = function(_ENV)
    if timer > delay then
      if btnp(4) then
        sfx(3)
        return 'game'
      elseif btnp(5) then
        sfx(3)
        return 'title'
      end
    else
      timer += 1
    end
    return 'gameOver'
  end,
  draw = function(_ENV)
    cls()
    print('game over', 40, 40, 7)
    print('final score ' .. finalScore, 32, 56, 7)
    if timer > delay then
      print('press 🅾️ to restart', 22, 64, 7)
      print('press ❎ for title screen', 10, 72, 7)
    end
  end
})