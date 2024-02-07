pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
Garden = entity:new({
  minX = 0, minY = 8,
  maxX = 12, maxY = 12,
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    map(0, 0, minX, minY, maxX, maxY)
  end,
  checkBounds = function(_ENV, boundingRect)
    printh(boundingRect.y1 >= minY * 8)
    if boundingRect.x1 >= minX * 8
        and boundingRect.x2 <= maxX * 8
        and boundingRect.y1 >= minY * 8
        and boundingRect.y2 <= maxY * 8 then
      return true
    end
    return false
  end
})


