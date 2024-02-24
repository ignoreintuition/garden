TileStack = entity:new({
  stack = {},
  costOffset = 0,
  currentItem = 1,
  offset = {
    { x = 18, y = 2 },
    { x = 20, y = 2 },
    { x = 18, y = 4 },
    { x = 20, y = 4 }
  },
  init = function(_ENV)
    for i = 1, 5 do
      stack[i] = {}
      stack[i].tile = Tile:new()
      stack[i].tile:init({ x = 100, y = 8 * i * 1.5 + 8 })
      stack[i].selected = false
    end
    stack[1].selected = true
  end,
  selectPrev = function(_ENV)
    sfx(4)
    stack[currentItem].selected = false
    if currentItem == 1 then
      currentItem = 5
    else
      currentItem = currentItem - 1
    end
    stack[currentItem].selected = true
    return { tile = {} }
  end,
  selectNext = function(_ENV)
    sfx(4)
    stack[currentItem].selected = false
    if currentItem == 5 then
      currentItem = 1
    else
      currentItem = currentItem + 1
    end
    stack[currentItem].selected = true
    return { tile = {} }
  end,
  selectTile = function(_ENV)
    cost = currentItem - 1 - costOffset
    if cost < 0 then
      cost = 0
    end
    if gameScene.coins >= cost then
      gameScene.coins = gameScene.coins - cost
      tile = stack[currentItem].tile
      tile:shift(0, 8)
      del(stack, stack[currentItem])
      newTile = Tile:new()
      newTile:init({ x = 100, y = 8 * 5 * 1.5 + 8 })
      add(stack, { tile = newTile, selected = false })
      for i = 1, 5 do
        stack[i].tile:shift(100, 8 * i * 1.5 + 8)
        stack[i].selected = false
      end
      stack[1].selected = true
      currentItem = 1
      gameScene.mode = 'place'
      sfx(2)
      return { tile = tile }
    end
    sfx(5)
    return { tile = {} }
  end,
  draw = function(_ENV)
    for i, v in ipairs(stack) do
      if stack[i].selected == true then
        cost = i - costOffset
        if cost < 0 then
          cost = 0
        end
        local x = 100
        local y = 8 * i * 1.5 + 8
        if gameScene.mode == 'select' then
          rectfill(x, y, x + 16, y + 8, 2)
        end
        if cost > 1 then
          for j = 1, cost - 1 do
            line(x + offset[j].x, y + offset[j].y, x + offset[j].x, y + offset[j].y, 10)
          end
        end
      end
      stack[i].tile:draw()
    end
  end,
  shuffle = function(_ENV)
    for i = 1, 5 do
      stack[i] = {}
      stack[i].tile = Tile:new()
      stack[i].tile:init({ x = 100, y = 8 * i * 1.5 + 8 })
      stack[i].selected = false
    end
    stack[1].selected = true
  end,
  reduceCost = function(_ENV)
    costOffset += 1
  end
})