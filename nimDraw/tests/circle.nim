import nimDraw

var turtle = newWalker((400,400),(200,250),length= 10, angle= 10)
for i in 0..36:
  turtle.walk()
  turtle.angle += 10
discard turtle.canvas.saveAsPng("circle.png")
