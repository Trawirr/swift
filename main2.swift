// Functions

//1)
func minValue(x1: Int, x2: Int) -> Int{
    if x1 < x2{
        return x1
    }
    else{
        return x2
    }
}
print(minValue(x1: 5, x2: 3))
print(minValue(x1: 3, x2: 5))

//2)
func lastDigit(_ x: Int) -> Int{
    return x%10
}
print(lastDigit(256))

//3)
func divides(_ a: Int, _ b: Int) -> Bool{
    if(a%b==0){
        return true
    }
    else{
        return false
    }
} 

func countDivisors(_ num: Int) -> Int{
    var c = 1
    for i in 2...num{
        if(divides(num, i)){
            c = c + 1
        } 
    }
    return c
}

func isPrime(_ num: Int) -> Bool{
    var c = countDivisors(num)
    if(c > 2){
        return false
    }
    else{
        return true
    }
}

print(divides(7, 3))
print(countDivisors(12))
print(isPrime(13))

// Closures 

//1)
func smartBart(n: Int, f: ()->()){
    for i in 1...n{
        f()
    }
}

smartBart(n:5){
    print("“I will pass this course with best mark, because Swift is great!”")
}

//2)
let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
var numbers4 = numbers.filter{$0 % 4 == 0}
print(numbers4)

//3)
var maxNumber = numbers.reduce(numbers[0]){max($0, $1)}
print(maxNumber)

//4)
var strings = ["Gdansk", "University", "of", "Technology"]
print(strings.reduce(""){$0 + $1 + " "})

//5)
let numbers2 = [1, 2 ,3 ,4, 5, 6]
var numbers5 = numbers2.filter{$0 % 2 == 1}
numbers5 = numbers5.map{$0*$0}
let sumNumbers = numbers5.reduce(0){$0+$1}

print("\(numbers5[0]) + \(numbers5[1]) + \(numbers5[2]) -> \(sumNumbers)")

//Tuples

//1)
func minmax(_ a: Int, _ b: Int) -> (Int, Int){
    if a<b{
        return (a, b)
    }
    else{
        return (b, a)
    }
}

print(minmax(3,1))

//2)
var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of",  "technology", "technology", "gdansk", "gdansk"]
var countedStrings: Array<(String, Int)> = []
for string in stringsArray{
    var counted = false
    for tuple in countedStrings{
        if tuple.0 == string{
            counted = true
        }
    }
    if counted == false{
        var counter = 0
        for string2 in stringsArray{
            if string == string2{
                counter += 1
            }
        }
        countedStrings.append((string, counter))
    }
}
print(countedStrings)

//Enums

//1)
enum Day: Int{
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7

    func dayEmoji() -> () {
        switch self{
            case .Monday:
                print("😊")
            case .Tuesday:
                print("🙌")
            case .Wednesday:
                print("🏆")
            case .Thursday:
                print("👩‍💻")
            case .Friday:
                print("🍾")
            case .Saturday:     
                print("🎉")
            case .Sunday:
                print("😢")
        }
    }
}

let day = Day.Monday
day.dayEmoji()