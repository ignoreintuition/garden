BoomStack = entity:new({
  booms = {},
  init = function(_ENV)
  end,
  update = function(_ENV)
    for i, v in ipairs(booms) do
      if v:isComplete() == true then
        del(booms, v)
      else
        v:update()
      end
    end
  end,
  draw = function(_ENV)
    for i, v in ipairs(booms) do
      v:draw()
    end
  end,
  add = function(_ENV, x, y)
    boom = Boom:new()
    boom:init(x, y)
    add(booms, boom)
  end
})

Boom = entity:new({
  x = 0, y = 0,
  interval = 8,
  timer = 0,
  frame = 1,
  animationCycle = { 19, 20, 21 },
  complete = false,
  init = function(_ENV, locX, locY)
    x = locX
    y = locY
  end,
  update = function(_ENV)
    timer += 1
    if timer == interval then
      newFrame = frame + 1
      if (newFrame > 3) then
        complete = true
      else 
        frame=newFrame
      end
      timer = 0
    end
  end,
  draw = function(_ENV)
    spr(animationCycle[frame], x, y)
  end,
  isComplete = function(_ENV)
    return complete
  end
})