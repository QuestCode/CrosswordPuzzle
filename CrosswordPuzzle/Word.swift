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

class Word: NSObject {
    public var word: String = ""
    public var hint: Hint = Hint(number: 1, info: "")
    public var direction: Direction = Direction.horizontal
    
    init(word: String, hint: Hint, direction: Direction) {
        super.init()
        self.word = word
        self.hint = hint
        self.direction = direction
    }
}
