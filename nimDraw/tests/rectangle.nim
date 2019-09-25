import nimDraw
var turtle = newWalker((400,400),(150,250),length= 100, angle= 0)

proc drawRect() =
  for i in 0..3:
    turtle.walk()
    turtle.angle += 90

drawRect()
turtle.position = (350,250)
turtle.color = newColor(255,0,0)
drawRect()

discard turtle.canvas.saveAsPng("rect.png")
