GameScene = Scene:new({
  name = 'game',
  timer = 100,
  coins = 0,
  score = 0,
  mode = 'select',
  init = function(_ENV)
    controller = Controller:new()
    currTile = Tile:new()
    garden = Garden:new()
    tileStack = TileStack:new()
    cards = Cards:new()
    ui = UI:new()

    currTile:init({ x = 0, y = 8 })
    garden:init()
    tileStack:init()
    cards:init()
    ui:init()
    
    timer = 100
    coins = 0
    score = 0
    mode = 'select'
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
    ui:update()
    res = controller:update({
      tile = currTile,
      garden = garden
    })
    currTile = res.tile
    garden:update()
    if mode == 'place' then
      currTile:update()
    end
    return 'game'
  end,
  draw = function(_ENV)
    cls()
    ui:draw()
    garden:draw()
    if mode == 'place' then
      currTile:draw()
    end
  end
})