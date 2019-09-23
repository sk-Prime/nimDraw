import nimpng
type
  RGBA*    = object
    r : uint8
    g : uint8
    b : uint8
    a : uint8
    
  Canvas* = object
    pixels : string #container of PNG pixels
    width  : int
    height : int
    bg     : RGBA
    elements : int
  
proc newColor*(r, g, b:uint8, a=255.uint8):RGBA =
  return RGBA(r: r, g: g, b: b, a: a)

let
  defaultWhite* = newColor(255, 255, 255)
  defaultBlack* = newColor(0, 0, 0)

proc newCanvas*(width: int, height: int, color= defaultBlack):Canvas =
  let elements = int(width*height*4)
  var tempCanvas = Canvas(pixels: "", width: width, height: height, bg: color, elements: elements)
  for _ in 0..(width*height):
    tempCanvas.pixels.add(color.r.char)
    tempCanvas.pixels.add(color.g.char)
    tempCanvas.pixels.add(color.b.char)
    tempCanvas.pixels.add(color.a.char)
  return tempCanvas

proc getPixel*(canvas: Canvas, x: int, y: int):(uint, RGBA) =
  let index = uint(x*4+(canvas.width*y*4))
  let pixel_value = RGBA(
    r:canvas.pixels[index].uint8,
    g:canvas.pixels[index+1].uint8,
    b:canvas.pixels[index+2].uint8,
    a:canvas.pixels[index+3].uint8)
  return (index,pixel_value)
 
proc setPixel*(canvas: var Canvas, x: int, y: int, color: RGBA) =
  let index = int(x*4+(canvas.width*y*4))
  if index < canvas.elements and index > -1:
    canvas.pixels[index] = color.r.char
    canvas.pixels[index+1] = color.g.char
    canvas.pixels[index+2] = color.b.char
    canvas.pixels[index+3] = color.a.char
  
proc saveAsPng*(canvas: Canvas, name="nimDraw.png"):bool =
  savePNG32(name,canvas.pixels, canvas.width, canvas.height)
