Controller = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV)
    if btnp(0) then
      tile:move({-1, 0})
    elseif btnp(1) then
      tile:move({1, 0})
    elseif btnp(2) then
      tile:move({0, -1})
    elseif btnp(3) then
      tile:move({0, 1})
    elseif btnp(4) then
      tile:rotate()
    end
  end
})