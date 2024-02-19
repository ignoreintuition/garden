Flower = entity:new({
  x = 0, y = 8, 
  src = flr(rnd(12)) + 1,
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    spr(src, x, y)
  end,
  move = function(_ENV, x, y)
  end
})


Explosion = entity:new({
  x = 0, y= 0,
  src = 19,
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    spr(src, x, y)
  end
})