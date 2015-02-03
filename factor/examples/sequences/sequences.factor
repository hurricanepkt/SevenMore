USING: kernel sequences prettyprint math quotations ;
IN: examples.sequences

: find-first ( seq callable -- elem ) filter any? [ first ] [ null ] if ; inline
    