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
    var crossword: Crossword!
    
    init(title: String,color: UIColor,crossword: Crossword) {
        self.title = title
        self.color = color
        self.crossword = crossword
    }
}
