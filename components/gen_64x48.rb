puts('#
# LED64x48
#
DEF LED8x8 LED 0 40 Y Y 1 F N
F0 "LED" 350 -550 60 H V C CNN
F1 "LED8x8" 400 -400 60 H V C CNN
F2 "" 0 0 60 H I C CNN
F3 "" 0 0 60 H I C CNN
DRAW
S 0 -100 800 -1050 0 1 0 N
')
for y in (0..47) do
puts("X R#{y} #{y+200+1} -200 #{-700-y*100} 200 R 50 50 1 1 I")
end
for x in (0..63) do
puts("X CE#{x} #{x+1} #{550+x*100} 600 200 D 50 50 1 1 I")
end
for x in (0..63) do
puts("X CO#{x} #{x+1+64} #{550+x*100} 100 200 D 50 50 1 1 I")
end

