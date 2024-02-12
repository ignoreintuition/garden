Controller = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV, game)
    if game.mode == 'place' then
      if btnp(0) then
        game.tile:move({ -1, 0 }, game.garden)
      elseif btnp(1) then
        game.tile:move({ 1, 0 }, game.garden)
      elseif btnp(2) then
        game.tile:move({ 0, -1 }, game.garden)
      elseif btnp(3) then
        game.tile:move({ 0, 1 }, game.garden)
      elseif btnp(4) then
        game.tile:rotate(game.garden)
      elseif btnp(5) then
        game.tile:place(game.garden)
        return {
          tile = {},
          mode = 'select'
        }
      end
      return {
        tile = game.tile,
        mode = 'place'
      }
    elseif game.mode == 'select' then
      for i = 1, 5 do
        if game.tileStack[i].selected == true then
          currentItem = i
        end
      end
      if btnp(2) then
        game.tileStack[currentItem].selected = false
        game.tileStack[currentItem - 1].selected = true
      elseif btnp(3) then
        game.tileStack[currentItem].selected = false
        game.tileStack[currentItem + 1].selected = true
      elseif btnp(4) then
        tile = game.tileStack[currentItem].tile
        tile.face[1].x = 0
        tile.face[1].y = 8
        tile.face[2].x = 8
        tile.face[2].y = 8
        return {
          tile = tile,
          mode = 'place'
        }
      end
      return {
        tile = {},
        mode = 'select'
      }
    end
  end
})