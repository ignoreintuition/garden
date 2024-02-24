Cards = entity:new({
  bomb = 32,
  refresh = 33,
  timer = 34,
  reduce = 35,
  selectedCard = 1,
  deck = {
    { spr = 32, offset = 0, cost = 1 },
    { spr = 33, offset = 20, cost = 2 },
    { spr = 34, offset = 40, cost = 3 },
    { spr = 35, offset = 60, cost = 4 }
  },
  init = function(_ENV)
    selectedCard = 1
  end,
  draw = function(_ENV)
    for i = 1, 4 do
      rectfill(10 + deck[i].offset, 108, 25 + deck[i].offset, 124, 1)
      rect(10 + deck[i].offset, 108, 25 + deck[i].offset, 124, 7)
      spr(deck[i].spr, 14 + deck[i].offset, 112)
      for j = 0, deck[i].cost - 1 do
        line(14 + deck[i].offset + j * 2, 122, 14 + deck[i].offset + j * 2, 122, 10)
      end
      if gameScene.mode == 'card' and i == selectedCard then
        rect(10 + deck[i].offset, 108, 25 + deck[i].offset, 124, 10)
      end
    end
  end,
  selectPrev = function(_ENV)
    sfx(4)
    if selectedCard == 4 then
      selectedCard = 1
    else
      selectedCard += 1
    end
  end,
  selectNext = function(_ENV)
    sfx(4)
    if selectedCard == 1 then
      selectedCard = 4
    else
      selectedCard -= 1
    end
  end,
  selectCard = function(_ENV)
    if gameScene.coins >= deck[selectedCard].cost then
      gameScene.coins -= deck[selectedCard].cost
      if deck[selectedCard].spr == bomb then
        gameScene.garden:bomb()
      elseif deck[selectedCard].spr == refresh then
        gameScene.tileStack:shuffle()
      elseif deck[selectedCard].spr == timer then
        gameScene.timer += 20
      elseif deck[selectedCard].spr == reduce then
      gameScene.tileStack:reduceCost()
      end
    end
  end
})