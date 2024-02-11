GameScene = Scene:new({
  name = 'game',
  coins = 0,
  score = 0,
  timer = 100,
  tileStack = {},
  init = function(_ENV)
    initTileStack(_ENV)
    ui = UI:new()
    controller = Controller:new()
    currTile = Tile:new()
    currTile:init({ x = 0, y = 8 })
    garden = Garden:new()
    garden:init()
    coins = 0
    score = 0
    timer = 100
  end,
  update = function(_ENV)
    if timer <= 0 then
      return 'gameOver'
    end
    if currInterval <= 0 then
      timer -= 1
      currInterval = timerInterval
    end
    currInterval -= 1
    ui:update({
      coins = coins,
      score = score,
      tileStack = tileStack,
      timer = timer
    })
    controller:update(currTile, garden)
    garden:update()
    currTile:update()
    return 'game'
  end,
  draw = function(_ENV)
    cls()
    ui:draw()
    garden:draw()
    currTile:draw()
  end,
  initTileStack = function(_ENV)
    for i = 1, 5 do
      tileStack[i] = Tile:new()
      tileStack[i]:init({ x = 104, y = 8 * i * 1.5 + 8 })
    end
  end
})