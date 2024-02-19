Garden = entity:new({
  flowers = {},
  minX = 0, minY = 1,
  maxX = 12, maxY = 12,
  init = function(_ENV)
    for y = 1, 12 do
      flowers[y] = {}
      for x = 1, 12 do
        flowers[y][x] = 0
      end
    end
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    map(0, 0, minX * 8, minY * 8, maxX, maxY)
    for y = 1, 12 do
      for x = 1, 12 do
        if flowers[y][x] > 0 then
          spr(flowers[y][x], (x - 1) * 8, y * 8)
        end
      end
    end
  end,
  checkBounds = function(_ENV, boundingRect)
    if boundingRect.x >= minX * 8
        and boundingRect.x + 8 <= maxX * 8
        and boundingRect.y >= minY * 8
        and boundingRect.y <= maxY * 8 then
      return true
    end
    sfx(0)
    return false
  end,
  checkCollision = function(_ENV, boundingRect)
    if flowers[boundingRect.y / 8][boundingRect.x / 8 + 1] > 0 then
      sfx(0)
      return true
    end
    return false
  end,
  score = function(_ENV)
    for y = 1, 12 do
      for x = 1, 12 do
        if flowers[y][x] > 0 then
          if not checkColumns(_ENV, y, x) then
            checkRows(_ENV, y, x)
          end
        end
      end
    end
  end,
  place = function(_ENV, tile)
    for i, v in ipairs(tile) do
      flowers[v.y / 8][v.x / 8 + 1] = v.src
    end
  end,
  checkColumns = function(_ENV, y, x)
    if y > 2
        and flowers[y - 1][x] == flowers[y][x]
        and flowers[y - 2][x] == flowers[y][x] then
      scoreFlowers(_ENV)
      flowers[y][x] = 0
      flowers[y - 1][x] = 0
      flowers[y - 2][x] = 0
      return true
    end
    return false
  end,
  checkRows = function(_ENV, y, x)
    if x > 2
        and flowers[y][x - 1] == flowers[y][x]
        and flowers[y][x - 2] == flowers[y][x] then
      scoreFlowers(_ENV)
      flowers[y][x] = 0
      flowers[y][x - 1] = 0
      flowers[y][x - 2] = 0
      return true
    end
    return false
  end,
  scoreFlowers = function(_ENV)
    gameScene.score += 10
    gameScene.timer += 3
    gameScene.coins += 1
  end
})