import Signal (Signal, map2)
import Mouse
import Text (asText)

mouse down position =  if | down -> asText position
                          | otherwise -> asText " "
main = map2 (mouse) Mouse.isDown Mouse.position 