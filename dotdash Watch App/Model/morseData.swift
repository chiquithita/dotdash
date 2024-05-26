//
//  morseData.swift
//  dotdash Watch App
//
//  Created by Elizabeth Chiquithita Bunga Ariona Chriska on 20/05/24.
//

import Foundation
import WatchKit


let morseCode: [Character: String] = [
    "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.",
    "G": "--.", "H": "....", "I": "..", "J": ".---", "K": "-.-", "L": ".-..",
    "M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.",
    "S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-",
    "Y": "-.--", "Z": "--..",
    "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
    "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..",
    "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.",
    "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-",
    "y": "-.--", "z": "--.."
]



func stringToMorse(_ input: String) -> String {
    var morseString = ""
    
    for character in input.uppercased() {
        if let morseChar = morseCode[character] {
            morseString += morseChar + " "
        } else if character == " " {
            morseString += "   " 
        }
    }
    print(morseString)
    return morseString.trimmingCharacters(in: .whitespaces)
}


