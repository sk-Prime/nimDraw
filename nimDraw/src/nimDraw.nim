import math
include nimDraw/pngHandle

type
  Walker = object
    canvas* : Canvas
    position* : (int,int)
    length* : int
    angle*  : int
    color*  : RGBA

proc linePoints(pointA: (int, int), pointB: (int,int)): (seq[(int,int)],bool) =
    ##port of Bresenham python algorithm from here http://www.roguebasin.com/index.php?title=Bresenham%27s_Line_Algorithm
    var 
      (x1, y1) = pointA
      (x2, y2) = pointB
      dx = x2 - x1
      dy = y2 - y1
      swapped = false
      points : seq[(int,int)]
    
    # Determine how steep the line is
    let is_steep = abs(dy) > abs(dx)
    
    # Rotate line
    if is_steep:
      (x1, y1) = (y1, x1)
      (x2, y2) = (y2, x2)
    
    # Swap start and end points if necessary and store swap state
    if x1 > x2:
      (x1, x2) = (x2, x1)
      (y1, y2) = (y2, y1)
      swapped = true
      
    # Recalculate differentials
    dx = x2 - x1
    dy = y2 - y1
    # Calculate error
    var
      error = int(dx.float / 2.0)
      ystep = if y1 < y2: 1 else: -1
      y = y1
    
    for x in countup(x1, x2 + 1,1):
      var coord = if is_steep: (y,x) else: (x, y)
      points.add(coord)
      error -= abs(dy)
      if error < 0:
        y += ystep
        error += dx
        
    return (points, swapped)

proc angleToCartesian(angle= 90, radius= 100): (int, int) =
  let radian = degToRad(angle.float)
  let x = int(round(radius.float * cos(radian)))
  let y = int(round(radius.float * sin(radian)))
  return (x,y) #provide ratio, need to fixed by given starting point

proc fixCartesian(cartPoint: (int,int), pointStart: (int,int)):(int,int)=
  let fixedPoint = (cartPoint[0]+pointStart[0],cartPoint[1]+pointStart[1])
  return fixedPoint 

proc newWalker*(field: (int,int), startPos:(int, int), length= 10, angle= 90, color= defaultWhite, bg= defaultBlack):Walker =
  let canvas = newCanvas(field[0],field[1],bg)
  let tempWalker= Walker(
    canvas : canvas,
    position: startPos,
    length : length,
    angle : angle,
    color : color
    )
  return tempWalker

proc walk*(walker: var Walker) =
  let startPos = walker.position
  let angle = walker.angle
  let length = walker.length
  let color = walker.color
  
  let endPos = fixCartesian(angleToCartesian(angle, length),startPos)
  let (points, swapped) = linePoints(startPos,endPos)
  walker.position = endPos
  if not swapped:
    for i in points:
      walker.canvas.setPixel(i[0],i[1],color)
  else:
    for index in countdown(points.high, points.low, 1):
      walker.canvas.setPixel(points[index][0],points[index][1],color)
