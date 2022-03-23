import Foundation

//Excercises - Strings and Text

//1
let num1 = 12
let num2 = 34

print("\(num1) + \(num2) = \(num1 + num2)")

//2
let pg = "Gdansk University of Technology"
let pg2 = pg.replacingOccurrences(of: "n", with: "⭐️")

print(pg + "\n" + pg2)

//3
let me = "Marcin Garnowski"
let me2 = String(me.reversed())

print(me2)


//Excercises - Control Flow
//1
for i in 1...11{
    print("I will pass this course with best mark, because Swift is great!")
}

//2
var n = 8
for i in 1...n{
    print(i*i)
}

//3
var m = 5
for i in 1...m{
    for j in 1...m{
        print("@", terminator: "")
    }
    print("")
}

//Excercises - Arrays

//1
var numbers = [5, 10, 20, 15, 80, 13]
var max = 0
for number in numbers{
    if number > max{
        max = number
    }
}
print(max)

//2
var numbers = [5, 10, 20, 15, 80, 13]
for number in numbers.reversed(){
    if number != numbers[0] {
        print(number, terminator: ", ")
    }
    else{
        print(number)
    }
}

//3
var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]
var unique = Array(Set(allNumbers))
print("unique = \(unique)")

//Excercises - Sets

//1
var number = 10
var divisors = Set<Int>()
for i in 1...10{
    if number % i == 0{
        divisors.insert(i)
    }
}
print("divisors = \(divisors.sorted())")


//Excercises - Dictionaries

//1
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]

var flightNumbers = Array<String>()

for dict in flights{
    if let number = dict["flightNumber"]{
        flightNumbers.append(number)
    }
}

print("flightNumbers = \(flightNumbers)")

//2
var names = ["Hommer","Lisa","Bart"]

var fullName: [[String:String]] = []
for name in names{
    var tmp: [String:String] = ["lastName":"Simpson", "firstName":name]
    fullName.append(tmp)
}
print("fullName = \(fullName)")