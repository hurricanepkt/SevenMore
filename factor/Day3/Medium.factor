USING: examples.checkout tools.test arrays io ;

IN: Day3.medium.tests



! { T{ cart-item f "Name" 1.23 1 } } [ 1.23 <cart-item-with-price> ] unit-test
! { 4.56 } [ 4.56 <cart-item-with-price> item-price ] unit-test
! { 70.00 } [ 100.00 <cart-item-with-price> .3 discount-item item-price ] unit-test
: <sample-cart> ( -- cart ) "7lang2" 50.00 2 <cart-item> "noderw" 100.00 1 <cart-item> 2array ;
: medium-checkout ( chekcout -- checkout ) 
  [ vat ] taxes [ flat-ship ] flat-shipping total ;
  
{ T{ checkout f 3 200.00 50.00 2.0 252.00 } } [ <sample-cart> <checkout>  medium-checkout ] unit-test