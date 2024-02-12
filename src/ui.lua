UI = entity:new({
  coins = 0,
  score = 0,
  timer = 0,
  tileStack = {},
  head = { x1 = 0, y1 = 0, x2 = 128, y2 = 8 },
  init = function(_ENV)
  end,
  update = function(_ENV, game)
    coins = game.coins
    score = game.score
    timer = game.timer
    tileStack = game.tileStack
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
    print("timer " .. timer, 0, 1, 7)
    spr(16, 50, 0)
    print(coins, 60, 1, 7)
    print("score " .. score, 90, 1, 7)
  end,
  drawRightRail = function(_ENV)
    rectfill(96, 8, 128, 104, 5)
    rectfill(100, 10, 124, 82, 1)
    rect(100, 10, 124, 82, 7)
    print('stack', 103, 12, 7)
    for i, v in ipairs(tileStack) do
      if tileStack[i].selected == true then
        rectfill(104, 8 * i * 1.5 + 8, 120, 8 * i * 1.5 + 15, 2)
      end
      tileStack[i].tile:draw()
    end
  end,
  drawFooter = function(_ENV)
    rectfill(0, 104, 128, 128, 5)
  end
})