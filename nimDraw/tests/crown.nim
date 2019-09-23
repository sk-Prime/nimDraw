import nimDraw
#demo of manual control
var turtle = newWalker((400,400),(100,240),length= 100, angle= 10)

var startpos = turtle.position

turtle.angle = -110
turtle.walk()

turtle.length = 70
turtle.angle = 30
turtle.walk()

turtle.length = 100
turtle.angle = -40
turtle.walk()

turtle.length = 100
turtle.angle = 40
turtle.walk()

turtle.length = 70
turtle.angle = -30
turtle.walk()

turtle.length = 100
turtle.angle = 110
turtle.walk()

turtle.position = startpos
turtle.angle = 0
turtle.length = 205
turtle.walk()

discard turtle.canvas.saveAsPng("crown.png")
