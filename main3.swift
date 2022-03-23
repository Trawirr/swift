import Foundation

struct Location{
    var id = 0
    var type = ""
    var name = ""
    var rating = 0
}

var Gdansk1 = Location(id:1, type: "Pub", name: "Lawendowa 8", rating: 5)
var Gdansk2 = Location(id:2, type: "Pub", name: "Graciarnia", rating: 4)
var Gdansk3 = Location(id:3, type: "Restaurant", name: "Menya Musashi", rating: 5)

var Barcelona1 = Location(id:4, type: "Pub", name: "La Piwo", rating: 4)
var Barcelona2 = Location(id:5, type: "Restaurant", name: "Pizzas", rating: 2)
var Barcelona3 = Location(id:6, type: "Restaurant", name: "Pierogies", rating: 5)


struct City{
    var id = 0
    var name = ""
    var description = ""
    var latitude = 0.0
    var longitude = 0.0
    var locations = [Location]()
    var keywords: Set<String> = []
}

var Gdansk = City()
Gdansk.id = 1
Gdansk.name = "Gdańsk"
Gdansk.description = "Polish coastal city"
Gdansk.latitude = 54.3521
Gdansk.longitude = 18.6463
Gdansk.locations = [Gdansk1, Gdansk2, Gdansk3]
Gdansk.keywords = ["Sea", "Seaside", "Poland", "Baltic Sea", "Study"]

var Sopot = City()
Sopot.id = 2
Sopot.name = "Sopot"
Sopot.description = "Polish coastal city"
Sopot.latitude = 54.3553
Sopot.longitude = 18.5211
Sopot.keywords = ["Sea", "Seaside", "Poland", "Baltic Sea", "Party"]


var Gdynia = City()
Gdynia.id = 3
Gdynia.name = "Gdynia"
Gdynia.description = "Polish coastal city"
Gdynia.latitude = 1.5753
Gdynia.longitude = 1.2311
Gdynia.keywords = ["Sea", "Seaside", "Poland", "Baltic Sea", "Port"]

var StarogardGdanski = City()
StarogardGdanski.name = "Starogard Gdański"

var Rumia = City()
Rumia.name = "Rumia"

var PruszczGdanski = City()
PruszczGdanski.name = "Pruszcz Gdański"

var Malbork = City()
Malbork.name = "Malbork"

var Zukowo = City()
Zukowo.name = "Żukowo"

var Wejherowo = City()
Wejherowo.name = "Wejherowo"

var Reda = City()
Reda.name = "Reda"

var Hel = City()
Hel.name = "Hel"

var Jastarnia = City()
Jastarnia.name = "Jastarnia"

var Tczew = City()
Tczew.name = "Tczew"

var Puck = City()
Puck.name = "Puck"

var Elblag = City()
Elblag.name = "Elbląg"

var Pszczolki = City()
Pszczolki.name = "Pszczółki"

var Szczecin = City()
Szczecin.name = "Szczecin"

var Gdanskv2 = City()
Gdansk2.name = "Gdańsk"
Gdansk2.id = 5

var Slupsk = City()
Slupsk.name = "Słupsk"

var Barcelona = City()
Barcelona.id = 20
Barcelona.name = "Barcelona"
Barcelona.description = "Spanish coastal city"
Barcelona.latitude = -41.3902
Barcelona.longitude = 2.1540
Barcelona.locations = [Barcelona1, Barcelona2, Barcelona3]
Barcelona.keywords = ["Sea", "Seaside", "Spain", "Party"]


let Cities: Array<City> = [Gdansk, Gdynia, Sopot, StarogardGdanski, Rumia, PruszczGdanski, Malbork, Zukowo, Wejherowo, Hel, Jastarnia, Tczew, Puck, Elblag, Pszczolki, Szczecin, Gdanskv2, Slupsk, Barcelona]

func findCity(_ cities: Array<City>, _ cityName: String) -> [City]{
    var list = [City]()
    for city in cities{
        if city.name == cityName{
            list.append(city);
        }
    }
    return list
}

var list = findCity(Cities, "Gdańsk")
for city in list{
    print("1. Name = \(city.name), ID = \(city.id)")
}

func findKeyword(_ cities: Array<City>, _ keyword: String) -> [City]{
    var list = [City]()
    for city in cities{
        if city.keywords.contains(keyword){
            list.append(city);
        }
    }
    return list
}

var list2 = findKeyword(Cities, "Seaside")
for city in list2{
    print("2. Name = \(city.name), ID = \(city.id)")
}

func distance(_ city1: City, _ city2: City) -> Double{
    return (city1.longitude - city2.longitude)*(city1.longitude - city2.longitude) + (city1.latitude - city2.latitude)*(city1.latitude - city2.latitude)
}

func distFromMe(_ latitude: Double, _ longitude: Double, _ cities: [City]) -> [City]{
    var myCoordinates = City()
    myCoordinates.latitude = latitude
    myCoordinates.longitude = longitude
    var cityClose = cities[0]
    var cityFar = cities[0]
    for city in cities{
        if distance(myCoordinates, city) < distance(myCoordinates, cityClose){
            cityClose = city
        }
        if distance(myCoordinates, city) > distance(myCoordinates, cityFar){
            cityFar = city
        }
    }
    return [cityClose, cityFar]
}
print(distance(Gdansk, Gdynia))

var list3 = distFromMe(1.0, 1.0, Cities)
for city in list3{
    print("3. Name = \(city.name), ID = \(city.id)")
}

func distFromList(_ cities: [City]) -> [City]{
    var citiesFilter = cities.filter(){$0.latitude != 0.0 && $0.longitude != 0.0}
    var city1 = citiesFilter[0]
    var city2 = citiesFilter[1]
    for cityA in citiesFilter{
        for cityB in citiesFilter{
            if distance(cityA, cityB) > distance(city1, city2){
                city1 = cityA
                city2 = cityB
        }
        }
    }
    return [city1, city2]
}

var list4 = distFromList(Cities)
for city in list4{
    print("4. Name = \(city.name), ID = \(city.id)")
}

func goodFood(_ cities: [City]) -> [City]{
    var citiesWith5 = [City]()
    for city in cities{
        for location in city.locations{
            if location.type == "Restaurant" && location.rating == 5 {
                citiesWith5.append(city)
                break
            }
        }
    }
    return citiesWith5
}

var list5 = goodFood(Cities)
for city in list5{
    print("5. Name = \(city.name), ID = \(city.id)")
}

func sortedLocations(_ city: City) -> [Location]{
    var locations = city.locations
    var sorted = 0
    while sorted == 0{
        sorted = 1
        for i in 0...locations.count-2{
            if locations[i].rating < locations[i+1].rating{
                var tmp = locations[i].rating
                locations[i].rating = locations[i+1].rating
                locations[i+1].rating = tmp
                sorted = 0
            }
        }
    }
    return locations
}

var list6 = sortedLocations(Barcelona)
for location in list6{
    print("6. Name = \(location.name), rating = \(location.rating)")
}

func printCities5(_ cities: [City]){
    for city in cities{
        var locations = [Location]()
        for location in city.locations{
            if location.rating == 5{
                locations.append(location)
            }
        }
        if locations.count > 0{
            print("\(city.name) with \(locations.count) 5-stars:")
            for location in locations{
                print("   \(location.name)")
            }
        }
    }
}

printCities5(Cities)