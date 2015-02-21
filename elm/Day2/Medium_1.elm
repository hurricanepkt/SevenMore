import Graphics.Element (..)
import Graphics.Collage (..)
import Color (..)
import Signal (map3 , foldp)
import Text (asText)
import Time (every, second)
import Mouse
import Window


main = map3 show Window.dimensions Mouse.isDown Mouse.position
  -- Signal.map asText count


up   = filled green (circle 24)
down = filled black (circle 24)
carBottom = filled black (rect 24 48)
carTop = filled red (circle 24)

drawCircle : Int -> Int -> Bool -> Int -> Int -> Form
drawCircle w h d x y = 
  case d of 
    True  -> carBottom
              |> moveX (normalizeX x w) 
              |> moveY (normalizeY y h)
    False -> carTop
              |> moveX (normalizeX x w)            
              |> moveY (normalizeY y h)

normalizeX : Int -> Int -> Float
normalizeX x w = 
  (minmax x w) - toFloat w / 2

normalizeY : Int -> Int -> Float
normalizeY y h = 
  0 - ((minmax y h) - toFloat h / 2)

minmax : Int -> Int -> Float
minmax a d = 
  if | a < 24    -> 24
     | a > d-24  -> toFloat (d - 24) 
     | otherwise -> toFloat a 

show : (Int,Int) -> Bool -> (Int,Int) -> Element
show (w,h) d (x,y) = collage w h [ drawCircle w h d x y ]

--http://charlieharvey.org.uk/page/seven_more_languages_elm_day2