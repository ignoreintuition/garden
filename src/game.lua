function _init()
  coins = 0
  score = 0
  ui = UI:new()
  controller = Controller:new()
  tile = Tile:new()
  garden = Garden:new()
end

function _update()
  ui:update()
  controller:update()
  garden:update()
  tile:update()
end

function _draw()
  cls()
  ui:draw()
  garden:draw()
  tile:draw()
end