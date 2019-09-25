import nimDraw

var turtle = newWalker((400,400),(300,50),length= 20, angle = -90)
for i in 0..36:
  turtle.walk()
  turtle.angle += i
discard turtle.canvas.saveAsPng("spiral.png")
