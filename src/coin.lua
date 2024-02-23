Coin = entity:new({
  interval = 8,
  timer = 0,
  frame = 0,
  flip = false,
  animationCycle = { 16, 17, 18, 17 },
  update = function(_ENV)
    timer += 1
    if timer == interval then
      frame = (frame + 1) % 4 
      timer = 0
    end
  end,
  draw = function(_ENV)
    if frame == 3 then 
      flip = true 
    else
      flip = false
    end
    spr(animationCycle[frame + 1], 50, 0, 1, 1, flip)
  end
})