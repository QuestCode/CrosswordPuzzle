//
//  Level.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/25/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class Level {
    var title: String = ""
    var color: UIColor = UIColor.black
    var puzzle: Puzzle!
    
    init(title: String,color: UIColor,puzzle: Puzzle) {
        self.title = title
        self.color = color
        self.puzzle = puzzle
    }
}
