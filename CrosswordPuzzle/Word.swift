//
//  Word.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/17/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

public enum Direction {
    case vertical
    case horizontal
}

class Word: NSObject,NSCoding {
    public var word = ""
    public var column = 0
    public var row = 0
    public var direction: String = "vertical"
    private var directionEnum: Direction = .vertical
    public var hint: Hint = Hint(info: "")
    
    public var rowIndexes = [Int]()
    public var columnIndexes = [Int]()
    
    
    init(word: String,column: Int, row: Int, direction: Direction) {
        super.init()
        self.word = word
        self.column = column
        self.row = row
        self.directionEnum = direction
        self.setDirection()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(word, forKey: "word")
        aCoder.encode(column, forKey: "column")
        aCoder.encode(row, forKey: "row")
        aCoder.encode(direction, forKey: "direction")
        aCoder.encode(hint, forKey: "hint")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.word = aDecoder.decodeObject(forKey: "word") as! String
        self.column = aDecoder.decodeInteger(forKey: "column")
        self.row = aDecoder.decodeInteger(forKey: "row")
        self.direction = aDecoder.decodeObject(forKey: "direction") as! String
        self.hint = aDecoder.decodeObject(forKey: "hint") as! Hint
    }

    private func setDirection() {
        if directionEnum == .horizontal {
            direction = "horizontal"
            var i = 0
            for _ in word {
                rowIndexes.append(row)
                columnIndexes.append(i)
                i += 1
            }
        } else {
            direction = "vertical"
            var i = 0
            for _ in word {
                rowIndexes.append(i)
                columnIndexes.append(column)
                i += 1
            }
        }
    }
    
}
