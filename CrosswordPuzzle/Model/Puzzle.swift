//
//  Puzzle.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/17/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class Puzzle {
    var words = [Word]()
    var lines = [String]()
    
    init(level: String) {
        getDataForCrossword(name: level)
    }
    
    init() {
        // This is for temporary only
    }
    
    
    private func getSwiftArrayFromPlist(name: String) -> NSDictionary {
        let path = Bundle.main.path(forResource: name, ofType: "plist")
        return NSDictionary(contentsOfFile: path!)!
    }
    
    private func getDataForCrossword(name: String) {
        let dictionary = getSwiftArrayFromPlist(name: name)
        
        let rows = dictionary.value(forKey: "Rows") as! NSArray
        let columns = dictionary.value(forKey: "Columns") as! NSArray
        let directions = dictionary.value(forKey: "Directions") as! NSArray
        let hints = dictionary.value(forKey: "Hints") as! NSArray
        let indexs = dictionary.value(forKey: "Numbers") as! NSArray
        let words = dictionary.value(forKey: "Words") as! NSArray
        let lines = dictionary.value(forKey: "Lines") as! NSArray

        for i in 0..<rows.count {
            let word = Word(word: (words[i] as! NSString) as String, index: (indexs[i] as! NSNumber).intValue, column: (columns[i] as! NSNumber).intValue, row: (rows[i] as! NSNumber).intValue, direction: (directions[i] as! NSString) as String, hint: Hint(info: (hints[i] as! NSString) as String))
            
            self.words.append(word)
        }

        for line in lines {
            self.lines.append((line as! NSString) as String)
        }
    }
}
