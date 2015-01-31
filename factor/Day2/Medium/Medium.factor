USING: kernel examples.sequences math tools.test ;
IN: Day2.Medium

{ 1 } [ { 1 2 3 } [ 2 < ] find-first ] unit-test
{ 3 } [ { 1 2 3 } [ 2 > ] find-first ] unit-test
{ null } [ { 1 2 3 } [ 4 > ] find-first ] unit-test