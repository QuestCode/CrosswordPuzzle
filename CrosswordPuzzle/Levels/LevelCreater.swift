//
//  LevelCreater.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/17/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class LevelCreater: NSObject {
    override init() {
        super.init()
        
        let crosswordsGenerator = CrosswordsGenerator(columns: 10, rows: 10, words: ["POLO","PLAY","MVP","PADS","LAP","OLYMPICS","CATCHER","COMPETE","OUT","PITCH","BAT","CREW","COACH"])
        crosswordsGenerator.generate()
        
        
        let result = crosswordsGenerator.result
        var words = [Word]()
        
        for word in result{
            if word.direction == .horizontal {
                let newWord = Word(word: word.word, column: word.column, row: word.row, direction: .horizontal)
                words.append(newWord)
            } else {
                let newWord = Word(word: word.word, column: word.column, row: word.row, direction: .vertical)
                words.append(newWord)
            }
            print("\(word.word)")
        }
        
        for word in words {
            switch word.word {
            case "CATCHER":
                word.hint.info = "Player that crouches behind home plate"
                word.hint.number = 1
            case "COMPETE":
                word.hint.info = "Take part in a contest"
                word.hint.number = 2
            case "PITCH":
                word.hint.info = "Throw (the ball) for the batter to try to hit"
                word.hint.number = 3
            case "COACH":
                word.hint.info = "Person who trains an athlete"
                word.hint.number = 4
            case "POLO":
                word.hint.info = "Played on a horse"
                word.hint.number = 5
            case "LAP":
                word.hint.info = "One full circuit"
                word.hint.number = 6
            case "CREW":
                word.hint.info = "Group of people who work closely together"
                word.hint.number = 6
            default:
                break
            }
        }
        
        let lines = crosswordsGenerator.lines
        
        let crossword = Crossword(allWords: words, lines: lines)
        
        let store = CrosswordStore()
        store.crossword = crossword
        store.saveChanges()
    }
}
