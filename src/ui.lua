UI = entity:new({
  head = { x1 = 0, y1 = 0, x2 = 128, y2 = 8 },
  init = function(_ENV)
    coin = Coin:new()
  end,
  update = function(_ENV)
    coin:update()
  end,
  draw = function(_ENV)
    drawHeader(_ENV)
    drawRightRail(_ENV)
    drawFooter(_ENV)
  end,
  drawHeader = function(_ENV)
    rectfill(0, 0, 128, 7, 5)
    rectfill(0, 0, 128, 6, 1)
    line(0, 7, 128, 7, 7)
    print("timer " .. gameScene.timer, 0, 1, 7)
    coin:draw()
    print(gameScene.coins, 60, 1, 7)
    print("score " .. gameScene.score, 90, 1, 7)
  end,
  drawRightRail = function(_ENV)
    rectfill(96, 8, 128, 104, 5)
    rectfill(98, 10, 126, 82, 1)
    rect(98, 10, 126, 82, 7)
    print('stack', 103, 12, 7)
    gameScene.tileStack:draw()

  end,
  drawFooter = function(_ENV)
    rectfill(0, 104, 128, 128, 5)
    gameScene.cards:draw()
    spr(64, 95, 110, 24, 16)
  end
})