USING: examples.checkout tools.test arrays io ;

IN: examples.checkout.tests

{ 49.98 } [ "7lang2" 24.99 2 <cart-item> cart-item-price ] unit-test

! START:sample_test
: <sample-cart> ( -- cart ) 
  "7lang2" 24.99 2 <cart-item> "noderw" 10.99 1 <cart-item> 2array ;

! { T{ checkout f 3 60.97 9.13 4.49 74.59 } } [ <sample-cart> <checkout>  sample-checkout ] unit-test


