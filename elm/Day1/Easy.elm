product list = 
  case list of
    [] -> 1
    head::tail -> head * product tail
foo = [1,2,3]
product foo


xOut item = item.x
points = [{x=3,y=4},{x=10,y=10}]
List.map xOut points

> person = { name = "Mark", age =32, address = { street = "123 Fake st", zip = "01810" }}
{ address = { street = "123 Fake st", zip = "01810" }, age = 32, name = "Mark" }
    : { address : { street : String, zip : String }
      , age : number
      , name : String
      }
> person.name
"Mark" : String
> person.address.street
"123 Fake st" : String
