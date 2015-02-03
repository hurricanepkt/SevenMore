USING: examples.checkout tools.test arrays io ;

IN: Day3.easy.tests

{ T{ cart-item f "Name" 1.23 1 } } [ 1.23 <cart-item-with-price> ] unit-test
{ 4.56 } [ 4.56 <cart-item-with-price> item-price ] unit-test
{ 70.00 } [ 100.00 <cart-item-with-price> .3 discount-item item-price ] unit-test


