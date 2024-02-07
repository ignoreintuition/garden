Tile = entity:new({
  face = {
    Flower:new({ src = rnd(12) + 1, x = 0, y = 8 }),
    Flower:new({ src = rnd(12) + 1, x = 8, y = 8 })
  },
  x = 0, y = 8,
  pos = 0,
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    face[1]:draw()
    face[2]:draw()
  end,
  rotate = function(_ENV)
    newPos = { { x = face[1].x, y = face[1].y }, { x = face[2].x, y = face[2].y } }
    if pos == 0 then
      newPos[2].x -= 8
      newPos[2].y += 8
    elseif pos == 1 then
      newPos[2].y -= 8
      newPos[1].x += 8
    elseif pos == 2 then
      newPos[1].x -= 8
      newPos[1].y += 8
    elseif pos == 3 then
      newPos[1].y -= 8
      newPos[2].x += 8
    end
    if garden:checkBounds({ x1 = newPos[1].x, y1 = newPos[1].y, x2 = newPos[1].x + 8, y2 = newPos[1].y + 8 }) then
      face[1].x = newPos[1].x
      face[1].y = newPos[1].y
      face[2].x = newPos[2].x
      face[2].y = newPos[2].y
      pos = (pos + 1) % 4
    end
  end,
  move = function(_ENV, delta)
    newPos = { { x = face[1].x, y = face[1].y }, { x = face[2].x, y = face[2].y } }
    newPos[1].x += delta[1] * 8
    newPos[1].y += delta[2] * 8
    newPos[2].x += delta[1] * 8
    newPos[2].y += delta[2] * 8
    if garden:checkBounds({ x1 = newPos[1].x, y1 = newPos[1].y, x2 = newPos[1].x + 8, y2 = newPos[1].y + 8 }) then
      face[1].x = newPos[1].x
      face[1].y = newPos[1].y
      face[2].x = newPos[2].x
      face[2].y = newPos[2].y
    end
  end,
  shallowCopy = function(_ENV)
    -- TODO shallow copy  
  end
})