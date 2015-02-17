> multiply a b = a * b
<function> : number -> number -> number
>
> multiply 6 8
48 : number

> times6 = multiply 6
<function> : number -> number

> times6 8
48 : number



> people = [{ name = "Mark", age =32, address = { street = "123 Fake st", zip = "01810" }}, \
|   { name = "Kid", age =12, address = { street = "123 Fake st", zip = "01810" }}, \
|   { name = "Teen", age =16, address = { street = "123 Fake st", zip = "01810" }}]
[{ address = { street = "123 Fake st", zip = "01810" }, age = 32, name = "Mark" },{ address = { street = "123 Fake st",
zip = "01810" }, age = 12, name = "Kid" },{ address = { street = "123 Fake st", zip = "01810" }, age = 16, name = "Teen"
 }]
    : List
        { address : { street : String, zip : String }
        , age : number
        , name : String
		}
  
> olderthan16 person = \
|   case person of \
|     []      -> [] \
|     head::tail  -> if head.age > 16 \
|                   then head :: olderthan16 tail \
|                   else olderthan16 tail
<function> : List { a |   age : comparable } -> List { a |   age : comparable }


> olderthan16 people
[{ address = { street = "123 Fake st", zip = "01810" }, age = 32, name = "Mark" }]
    : List
        { address : { street : String, zip : String }
        , name : String
        , age : comparable
        }