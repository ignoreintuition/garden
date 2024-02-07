Garden = entity:new({
  minX = 0, minY = 1,
  maxX = 12, maxY = 12,
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    map(0, 0, minX * 8, minY * 8, maxX, maxY)
  end,
  checkBounds = function(_ENV, boundingRect)
    printh(boundingRect.y1)
    if boundingRect.x1 >= minX * 8
        and boundingRect.x2 <= maxX * 8
        and boundingRect.y1 >= minY * 8
        and boundingRect.y2 <= maxY * 8 then
      return true
    end
    return false
  end
})