GameScene = Scene:new({
  name = 'game',
  mode = 'select',
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
    res = controller:update({
      tile = currTile,
      garden = garden,
      mode = mode,
      tileStack = tileStack
    })
    mode = res.mode
    currTile = res.tile
    garden:update()
    if mode == 'place' then
      currTile:update()
    end
    return 'game'
  end,
  setMode = function(_ENV, m)
    mode = m
  end,
  draw = function(_ENV)
    cls()
    ui:draw()
    garden:draw()
    if mode == 'place' then
      currTile:draw()
    end
  end,
  initTileStack = function(_ENV)
    for i = 1, 5 do
      tileStack[i] = {}
      tileStack[i].tile = Tile:new()
      tileStack[i].tile:init({ x = 104, y = 8 * i * 1.5 + 8 })
      tileStack[i].selected = false
    end
    tileStack[1].selected = true
  end
})