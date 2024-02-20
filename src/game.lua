state = 'title'
prevState = 'title'
function _init()
  titleScene = TitleScene:new()
  gameScene = GameScene:new()
  gameOverScene = GameOverScene:new()
  settingsScene = SettingsScene:new()

  titleScene:init()
  gameScene:init()
  gameOverScene:init()
  settingsScene:init()
  
  printMeta()
end

function _update()
  if prevState != state then
    if state == 'title' then
      titleScene:init()
    elseif state == 'game' then
      gameScene:init()
    elseif state == 'gameOver' then
      gameOverScene:init(gameScene.score)
    elseif state == 'settings' then
      settingsScene:init()
    end
    prevState = state
  end
  if state == 'title' then
    state = titleScene:update()
  elseif state == 'game' then
    state = gameScene:update()
  elseif state == 'gameOver' then
    state = gameOverScene:update()
  elseif state == 'settings' then
    state = settingsScene:update()
  end
end

function _draw()
  if state == 'title' then
    titleScene:draw()
  elseif state == 'game' then
    gameScene:draw()
  elseif state == 'gameOver' then
    gameOverScene:draw()
  elseif state == 'settings' then
    settingsScene:draw()
  end
end

function printMeta()
  printh("\n\n-==Flowers==-\nby IgnoreIntuition\nLocked and stocked")
  printh(stat(93) .. ":" .. stat(94) .. ":" .. stat(95))
  printh("mem usage: " .. stat(0))
  printh("CPU: " .. stat(1))
end