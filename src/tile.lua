Tile = entity:new({
  flowerCnt = 12,
  face = {
    Flower:new({ src = flr(rnd(flowerCnt)) + 1, x = 0, y = 8 }),
    Flower:new({ src = flr(rnd(flowerCnt)) + 1, x = 8, y = 8 })
  },
  newPos = { { x = 0, y = 0 }, { x = 0, y = 0 } },
  x = 0, y = 8,
  pos = 0,
  init = function(_ENV, loc)
    flowerCnt = settingsScene.flowerCnt
    face = {
      Flower:new({ src = flr(rnd(flowerCnt)) + 1, x = loc.x, y = loc.y }),
      Flower:new({ src = flr(rnd(flowerCnt)) + 1, x = loc.x + 8, y = loc.y })
    }
    newPos = { { x = 0, y = 0 }, { x = 0, y = 0 } }
    x = 0
    y = 8
    pos = 0
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    face[1]:draw()
    face[2]:draw()
  end,
  rotate = function(_ENV, garden)
    shallowCopy(_ENV, newPos, face)
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

    if garden:checkBounds(newPos[1])
        and garden:checkBounds(newPos[2]) then
      pos = (pos + 1) % 4
      shallowCopy(_ENV, face, newPos)
    end
  end,
  move = function(_ENV, delta, garden)
    shallowCopy(_ENV, newPos, face)
    newPos[1].x += delta[1] * 8
    newPos[1].y += delta[2] * 8
    newPos[2].x += delta[1] * 8
    newPos[2].y += delta[2] * 8
    if garden:checkBounds(newPos[1])
        and garden:checkBounds(newPos[2]) then
      shallowCopy(_ENV, face, newPos)
    end
  end,
  place = function(_ENV, garden)
    garden:place(face)
  end,
  shift = function(_ENV, newX, newY)
    x = newX
    y = newY
    face[1].x = newX
    face[1].y = newY
    face[2].x = newX + 8
    face[2].y = newY
  end,
  shallowCopy = function(_ENV, dest, src)
    dest[1].x = src[1].x
    dest[1].y = src[1].y
    dest[2].x = src[2].x
    dest[2].y = src[2].y
  end
})