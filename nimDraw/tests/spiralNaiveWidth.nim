import nimDraw
#nim draw currently doesn't support width, this trick can be use
var turtle = newWalker((400,400),(300,50),length= 20, angle = -90)
for x in 0..10:
  turtle.position = (300+x,50)
  turtle.angle = -90
  for i in 0..36:
    turtle.walk()
    turtle.angle += i
discard turtle.canvas.saveAsPng("naiveWidthSpiral.png")
