Controller = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV, game)
    if gameScene.mode == 'place' then
      return placeTile(_ENV, game)
    elseif gameScene.mode == 'select' then
      return selectTile(_ENV, game)
    elseif gameScene.mode == 'card' then
      return selectCard(_ENV, game)
    end
  end,
  placeTile = function(_ENV, game)
    if btnp(0) then
      game.tile:move({ -1, 0 }, game.garden)
    elseif btnp(1) then
      game.tile:move({ 1, 0 }, game.garden)
    elseif btnp(2) then
      game.tile:move({ 0, -1 }, game.garden)
    elseif btnp(3) then
      game.tile:move({ 0, 1 }, game.garden)
    elseif btnp(5) then
      game.tile:rotate(game.garden)
    elseif btnp(4) then
      if not game.garden:checkCollision(game.tile.face[1]) and not game.garden:checkCollision(game.tile.face[2]) then
        game.tile:place(game.garden)
        game.garden:score()
        gameScene.mode = 'select'
        return { tile = {} }
      end
    end
    return {
      tile = game.tile
    }
  end,
  selectTile = function(_ENV, game)
    if btnp(2) then
      return gameScene.tileStack:selectPrev(_ENV)
    elseif btnp(3) then
      return gameScene.tileStack:selectNext(_ENV)
    elseif btnp(4) then
      return gameScene.tileStack:selectTile(_ENV)
    elseif btnp(5) then
      gameScene.mode = 'card'
    end
    return { tile = {} }
  end,
  selectCard = function(_ENV, game)
    if btnp(1) then
      gameScene.cards:selectPrev()
    elseif btnp(0) then
      gameScene.cards:selectNext()
    elseif btnp(4) then
      gameScene.cards:selectCard()
    elseif btnp(5) then
      gameScene.mode = 'select'
    end
    return { tile = {} }
  end
})