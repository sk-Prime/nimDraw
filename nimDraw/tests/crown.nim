import nimDraw
#demo of manual control
var turtle = newWalker((400,400),(120,240),length= 100, angle= 0)

let startpos = turtle.position

turtle.angle = 60
turtle.walk()

turtle.length = 70
turtle.angle = 210
turtle.walk()

turtle.length = 100
turtle.angle = 130
turtle.walk()

turtle.length = 100
turtle.angle = -130
turtle.walk()

turtle.length = 70
turtle.angle = -210
turtle.walk()

turtle.length = 100
turtle.angle = -60
turtle.walk()

turtle.walkTo(startpos)

discard turtle.canvas.saveAsPng("crown.png")
