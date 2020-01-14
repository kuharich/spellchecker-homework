//
//  main.swift
//  Spell-checker
//
//  Created by Mark Kuharich on 1/9/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import Foundation

var dictionary =  [String]()

let url = URL.init(fileURLWithPath: "/Users/mark/Downloads/spellchecker-homework/words")
do {
    let text = try String(contentsOf: url, encoding: .utf8)
    dictionary = text.split(separator: "\n").map{ $0.trimmingCharacters(in: .whitespacesAndNewlines)}
} catch {
    print("Unexpected error: \(error).")
}

func removeRepeatCharacters(from word: String) -> String {
    var result = ""
    var previous: Character = " "
    for c in word {
        if previous.lowercased() != c.lowercased() {
            result += String(c)
        }
        previous = c
    }
    return result
}

func checkWord(_ word: String) -> String {
    if dictionary.contains(word) {
        return word
    }
    for correctWord in dictionary {
        if correctWord.lowercased() == word.lowercased() {
            return correctWord
        }
        if removeRepeatCharacters(from: correctWord).lowercased() == removeRepeatCharacters(from: word).lowercased() {
            return correctWord
        }
    }
    return "No Correction Found"
}

/* It will correct two kinds of errors on the incoming word and then return the corrected word:
    It fixes bad casing */
print(checkWord("wetumpka"))
print(checkWord("paRNAssus"))

    // It removes invalid repeating characters
print(checkWord("tabble"))
print(checkWord("rrreally"))

// If the incoming word is already correct, the function should return the original word.
print(checkWord("aalii"))

/* If the incoming word is not correct and no correction can be found, the function should return the string “No Correction Found" */
print(checkWord("Lorem"))
