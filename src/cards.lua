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
        rect(11 + deck[i].offset, 109, 24 + deck[i].offset, 123, 10)
      end
    end
  end,
  selectPrev = function(_ENV)
    selectedCard += 1
  end,
  selectNext = function(_ENV)
    selectedCard -= 1
  end,
  selectCard = function(_ENV)
  end
})