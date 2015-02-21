import Signal (map, foldp)
import Text (asText)
import Time (every, second)


seconds = foldp (\foo secondscount -> secondscount + 1) 1 (every second)


main = map asText seconds