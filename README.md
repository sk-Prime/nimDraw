# nimDraw
A simple drawing package for nim
### Dependency
- <a href="https://github.com/jangko/nimPNG">nimPNG</a>
<hr>

only single pixel line drawing is supported. in future try to implement some of the features listed below
- flood fill
- shape fill
- line width
- storing mechanism of shape steps
- text insertion
```
Angle   90 deg
          |
0 deg ----|---- 180 deg or -0 deg
          |
        270 deg
        -90 deg
```
Go to test folder to see some examples

![Spiral](https://raw.githubusercontent.com/sk-Prime/nimDraw/master/nimDraw/tests/spiral.png) ![flower](https://raw.githubusercontent.com/sk-Prime/nimDraw/master/nimDraw/tests/flower.png)
![Crown](https://raw.githubusercontent.com/sk-Prime/nimDraw/master/nimDraw/tests/crown.png) ![Rect](https://raw.githubusercontent.com/sk-Prime/nimDraw/master/nimDraw/tests/rect.png)

### Demo
Draw Circle

```Nim
import nimDraw

var turtle = newWalker((400,400),(200,250),length= 10, angle= 10)
for i in 0..36:
  turtle.walk()
  turtle.angle += 10
discard turtle.canvas.saveAsPng("circle.png")
```
