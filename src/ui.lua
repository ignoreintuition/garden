UI = entity:new({
  head = { x1 = 0, y1 = 0, x2 = 128, y2 = 8 },
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    drawHeader(_ENV)
    drawRightRail(_ENV)
    drawFooter(_ENV)
  end,
  drawHeader = function(_ENV)
    rectfill(0, 0, 128, 7, 5)
    print("flowers", 0, 1, 7)
    spr(16, 40, 0)
    print(coins, 50, 1, 7)
    print("score " .. score, 80, 1, 7)
  end,
  drawRightRail = function(_ENV)
    rectfill(96, 8, 128, 104, 5)
  end,
  drawFooter = function(_ENV)
    rectfill(0, 104, 128, 128, 5)
  end
})