//: Playground - noun: a place where people can play

import UIKit


extension String {
    func romanNumeralIntValue() throws -> Int  {
        if range(of: "^(?=[MDCLXVI])M*(C[MD]|D?C{0,3})(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$", options: .regularExpression) == nil  {
            throw NSError(domain: "NotValidRomanNumber", code: -1, userInfo: nil)
        }
        var result = 0
        var maxValue = 0
        uppercased().characters.reversed().forEach {
            let value: Int
            switch $0 {
            case "M":
                value = 1000
            case "D":
                value = 500
            case "C":
                value = 100
            case "L":
                value = 50
            case "X":
                value = 10
            case "V":
                value = 5
            case "I":
                value = 1
            default:
                value = 0
            }
            maxValue = max(value, maxValue)
            result += value == maxValue ? value : -value
        }
        return result
    }
}

let romanNumStringOne : String
romanNumStringOne = "LXXXIX"    //89
let romanNumStringTwo : String
romanNumStringTwo = "LXXVIII"   //78

let invalidRomanString : String // invalid Roman Numeral
invalidRomanString = "XXXX"


do {
    let decimal = try romanNumStringOne.romanNumeralIntValue()  //89
    print(decimal)
} catch let error as NSError {
    
    print("\(romanNumStringOne) -- Not a valid Roman Number")
    print(error.code)
    print(error.domain)
}

do {
    let decimal = try romanNumStringTwo.romanNumeralIntValue()  //78
    print(decimal)
} catch let error as NSError {
    
    print("\(romanNumStringTwo) -- Not a valid Roman Number")
    print(error.code)
    print(error.domain)
}

do {
    let decimal = try invalidRomanString.romanNumeralIntValue()  //invalid Roman Numeral
    print(decimal)
} catch let error as NSError {
    
    print("\(invalidRomanString) -- Not a valid Roman Number")
    print(error.code)
    print(error.domain)
}



