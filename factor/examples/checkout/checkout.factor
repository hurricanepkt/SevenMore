USING: kernel accessors locals
  math math.order math.functions math.parser
  sequences sequences.repeating ;

IN: examples.checkout

TUPLE: cart-item name price quantity ;

TUPLE: checkout item-count base-price taxes shipping total-price ;

: <cart-item> ( name price quantity -- cart-item ) cart-item boa ;
: <cart-item-with-price> ( price -- cart-item ) "Name" 1 rot swap cart-item boa ;
: sum ( seq -- n  ) 0 [ + ] reduce ;
: cart-item-count ( cart -- count ) [ quantity>> ] map sum ;
: cart-item-price ( cart-item -- price ) [ price>> ] [ quantity>> ] bi * ;
: cart-base-price ( cart -- price ) [ cart-item-price ] map sum ;

: item-price ( cart-item -- price )  price>> ; 
: discount-item ( cart-item discount -- cart-item ) -1 + -1 * swap dup rot swap price>> * >>price ;

: <base-checkout> ( item-count base-price -- checkout )
  f f f checkout boa ;
: <checkout>  ( cart -- checkout )
  [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;

CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975
CONSTANT: vat-rate 0.25
: gst-pst ( price -- taxes ) [ gst-rate * ] [ pst-rate * ] bi + ;
: vat ( price -- taxes )  vat-rate *  ; 

: taxes ( checkout taxes-calc -- taxes )
    [ dup base-price>> ] dip 
    call >>taxes ; inline
! END:taxes

! START:shipping
CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.00
CONSTANT: flat-rate 2.00
: per-item ( checkout -- shipping ) per-item-shipping * base-shipping + ;
: flat-ship ( -- shipping ) flat-rate ;
: flat-shipping ( checkout shipping-calc -- shipping ) call >>shipping ; inline 

: shipping ( checkout shipping-calc -- shipping )
    [ dup item-count>> ] dip
    call >>shipping ; inline
! END:shipping

: total ( checkout -- total-price ) dup
    [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ;



: sample-checkout ( checkout -- checkout )
    [ gst-pst ] taxes [ per-item ] shipping total ;

: medium-checkout ( chekcout -- checkout ) 
  [ vat ] taxes [ flat-ship ] flat-shipping total ;
