//
//  morseData.swift
//  dotdash Watch App
//
//  Created by Elizabeth Chiquithita Bunga Ariona Chriska on 20/05/24.
//

import Foundation

// Morse code dictionary
let morseCode: [Character: String] = [
    "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.",
    "G": "--.", "H": "....", "I": "..", "J": ".---", "K": "-.-", "L": ".-..",
    "M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.",
    "S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-",
    "Y": "-.--", "Z": "--.."
]

// Function to convert a string to Morse code
func stringToMorse(_ input: String) -> String {
    var morseString = ""
    
    for character in input.uppercased() {
        if let morseChar = morseCode[character] {
            morseString += morseChar + " "
        } else {
            // For spaces or unsupported characters, add a space
            morseString += " "
        }
    }
    
    return morseString.trimmingCharacters(in: .whitespaces)
}

// Function to convert Morse code to a string
func morseToString(_ input: String) -> String {
    let morseWords = input.components(separatedBy: "   ") // Separate words by three spaces
    var decodedMessage = ""
    
    for morseWord in morseWords {
        let morseChars = morseWord.components(separatedBy: " ") // Separate letters by a space
        for morseChar in morseChars {
            if let decodedChar = morseCode.first(where: { $0.value == morseChar })?.key {
                decodedMessage.append(decodedChar)
            } else {
                // For unsupported Morse sequences, add a question mark
                decodedMessage.append("?")
            }
        }
        decodedMessage.append(" ") // Add a space between words
    }
    
    return decodedMessage.trimmingCharacters(in: .whitespaces)
}

// Example usage
let text = "Hello World"
let morse = stringToMorse(text)
//print("Morse code: \(morse)")

let decodedText = morseToString(morse)
//print("Decoded text: \(decodedText)")
