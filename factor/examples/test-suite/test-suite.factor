! START:init
USING: tools.test io io.streams.null kernel namespaces sequences ;

USE: examples.greeter 
USE: Day2.Easy
USE: Day2.Medium

IN: examples.test-suite

: test-all-examples ( -- )
    [ "examples" test ] with-null-writer 
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;
: test-all-day2 ( -- )
    [ "Day2" test ] with-null-writer 
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;
MAIN: test-all-day2