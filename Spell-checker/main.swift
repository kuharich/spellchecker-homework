//
//  main.swift
//  Spell-checker
//
//  Created by Mark Kuharich on 1/9/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import Foundation

var knownWords: [String:Int] = [:]
var set = Set<Character>()

guard let reader = LineReader(path: "/Users/mark/Downloads/spellchecker-homework/words") else {
    throw NSError(domain: "FileNotFound", code: 404, userInfo: nil)
}

for line in reader {
    knownWords[line.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)] = 1
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension RangeReplaceableCollection where Element: Hashable {
    var squeezed: Self {
        var set = Set<Element>()
        return filter{ set.insert($0).inserted }
    }
}

func checkWord(wordToCheck: String) -> String {
    if knownWords[wordToCheck] as Int? == 1 {
        return wordToCheck
    } else if knownWords[wordToCheck.lowercased().capitalizingFirstLetter()] as Int? == 1 {
        return wordToCheck.lowercased().capitalizingFirstLetter()
    } else if knownWords[wordToCheck.squeezed]as Int? == 1 {
        return wordToCheck.squeezed
    } else {
        return "No Correction Found"
    }
}

/* It will correct two kinds of errors on the incoming word and then return the corrected word:
    It fixes bad casing */
print(checkWord(wordToCheck: "wetumpka"))
print(checkWord(wordToCheck: "paRNAssus"))

    // It removes invalid repeating characters
print(checkWord(wordToCheck: "tabble"))
print(checkWord(wordToCheck: "rrreally"))

// If the incoming word is already correct, the function should return the original word.
print(checkWord(wordToCheck: "aalii"))

/* If the incoming word is not correct and no correction can be found, the function should return the string “No Correction Found" */
print(checkWord(wordToCheck: "Lorem"))
