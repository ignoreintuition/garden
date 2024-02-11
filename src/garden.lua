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
    return false
  end,
  place = function(_ENV, tile)
    for i, v in ipairs(tile) do
      flowers[v.y/8][v.x/8+1] = v.src
    end
  end
})