//
//  Hint.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/16/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class Hint: NSObject {
    var number: Int = 1
    var info: String = ""
    
    init(number: Int,info: String) {
        super.init()
        self.number = number
        self.info = info
    }
}
