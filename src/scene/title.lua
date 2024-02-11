TitleScene = Scene:new({
  name = 'title',
  init = function(_ENV)
  end,
  update = function(_ENV)
    if btnp(4) then
      return 'game'
     end
  return 'title'
  end,

  draw = function(_ENV)
    cls()
    spr(8, 30, 38)
    spr(9, 65, 38)
    print('garden', 40, 40)
  end
})