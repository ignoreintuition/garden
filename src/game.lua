state =  'title' 
function _init()
  titleScene = TitleScene:new()
  titleScene:init()
  gameScene = GameScene:new()
  gameScene:init()
  gameOverScene = GameOverScene:new()
  gameOverScene:init()
  printMeta()
end

function _update()
  if state == 'title' then
    prevState = state
    state = titleScene:update()
    if prevState != state then
      titleScene:init()
    end
  elseif state == 'game' then
    prevState = state
    state = gameScene:update()
    if prevState != state then
      gameScene:init()
    end
  elseif state == 'gameOver' then
    prevState = state
    state = gameOverScene:update()
    if prevState != state then
      gameOverScene:init()
    end
  end
end

function _draw()
  if state == 'title' then
    titleScene:draw()
  elseif state == 'game' then
    gameScene:draw()
  elseif state == 'gameOver' then
    gameOverScene:draw()
  end
end

function printMeta()
  printh("\n\n-==Flowers==-\nby IgnoreIntuition\nLocked and stocked")
  printh(stat(93) .. ":" .. stat(94) .. ":" .. stat(95))
  printh("mem usage: " .. stat(0))
  printh("CPU: " .. stat(1))
end