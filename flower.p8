pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--game
#include src/game.lua
#include src/oop.lua
#include src/controller.lua
#include src/ui.lua
#include src/garden.lua
#include src/flower.lua
#include src/tile.lua

__gfx__
000000000000000000c0000000000000000000000007700000000000000cc00000000000000cc000000000000000000000000000333333330000000000000000
0000000000e11e000011011c099900a0007007000007b0000082280000c11c008808808800cccc000077077000a000a000b0080b3b3333330000000000000000
001001000e1ee1e00011011009890a1a071771700000b7000888888001c11c10818118180c1cc1c0077777700009090000bb0bbb333333b30000000000000000
0001100001e11e1000055100099191a0007997000000777008888880cc1cc1cc08811880ccc11ccc077117000a00900a00008000333333330000000000000000
000110000e1ee1e0c115511c0009900000799700007bb71000288200cc1cc1cc08888880ccc11ccc00711770009999a00000b000333b33330000000000000000
00100100000bb00011111b110a10b1a0071771700777b0000bb22bb001cbbc10818888180c1cc1c007777770a001100a00b80b00333333330000000000000000
0000000000bbbb00000110b0a1a0ba1a0070b7000170b00000bbbb00000bb000880bb08800cccc00077b77000a9199a00bbbbbb03b3333b30000000000000000
00000000000bb000000c100baa00b0aa0000b0000000b00000055000000bb000000bb000000bb000000bb000000b0000000b0000333333330000000000000000
00aa9000000a90000009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaaa90000aaa900000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaa9aa9000a9a900000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa9aaa9000a9a900000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaa9aa9000a9a900000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a9aa90000aaa900000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa9000000a90000009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0000000000000000000000000000000000000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0000000000000000000000000000000000000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
