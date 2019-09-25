import nimDraw
import random

randomize()
var turtle = newWalker((400,400),(200,255),length= 20, angle= 10)

proc colorGen():RGBA=
  let r = rand(255).uint8
  let g = rand(255).uint8
  let b = rand(255).uint8
  return newColor(r,g,b)
proc circle() =
  for i in 0..36:
    turtle.walk()
    turtle.angle += 10

for i in 0..36:
  circle()
  turtle.angle += 10
  turtle.color = colorGen()

discard turtle.canvas.saveAsPng("flower.png")
