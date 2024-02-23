GameScene = Scene:new({
  name = 'game',
  timer,
  coins,
  score,
  mode,
  init = function(_ENV)
    timer = settingsScene.timer
    coins = 0
    score = 0
    mode = 'select'

    controller = Controller:new()
    currTile = Tile:new()
    garden = Garden:new()
    tileStack = TileStack:new()
    boomStack = BoomStack:new()
    cards = Cards:new()
    ui = UI:new()

    currTile:init({ x = 0, y = 8 })
    garden:init()
    tileStack:init()
    boomStack:init()
    cards:init()
    ui:init()
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
    boomStack:update()
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
    boomStack:draw()
  end
})