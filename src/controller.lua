Controller = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV, tile, garden)
    if btnp(0) then
      tile:move({ -1, 0 }, garden)
    elseif btnp(1) then
      tile:move({ 1, 0 }, garden)
    elseif btnp(2) then
      tile:move({ 0, -1 }, garden)
    elseif btnp(3) then
      tile:move({ 0, 1 }, garden)
    elseif btnp(4) then
      tile:rotate(garden)
    elseif btnp(5) then
      tile:place(garden)
      tile:init({ x = 0, y = 8 })
    end
  end
})