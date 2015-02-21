import Signal (Signal, map2)
import Mouse
import Text (asText)

mouse down position = asText (down, position)

main = map2 (mouse) Mouse.isDown Mouse.position 