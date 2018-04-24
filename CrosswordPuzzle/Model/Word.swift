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
    public var index = 1 
    public var column = 0
    public var row = 0
    public var direction: String = ""
    private var directionEnum: Direction = .vertical
    public var hint: Hint = Hint(info: "")
    
    public var rowIndexes = [Int]()
    public var columnIndexes = [Int]()
    
    
    init(word: String,index: Int,column: Int, row: Int, direction: Direction) {
        super.init()
        self.word = word
        self.index = index
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
        aCoder.encode(index, forKey: "index")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.word = aDecoder.decodeObject(forKey: "word") as! String
        self.column = aDecoder.decodeInteger(forKey: "column")
        self.row = aDecoder.decodeInteger(forKey: "row")
        self.direction = aDecoder.decodeObject(forKey: "direction") as! String
        self.hint = aDecoder.decodeObject(forKey: "hint") as! Hint
        self.index = aDecoder.decodeInteger(forKey: "index")
    }

    private func setDirection() {
        if directionEnum == .horizontal {
            direction = "horizontal"
            hint.numberDirection = "\(index) ➡"
        } else {
            direction = "vertical"
            hint.numberDirection = "\(index) ⬇"
        }
    }
    
}
