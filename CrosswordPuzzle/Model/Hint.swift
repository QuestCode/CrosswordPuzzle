//
//  Hint.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/16/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class Hint: NSObject, NSCoding {
    var number: Int = 1
    var info: String = ""
    
    init(info: String) {
        super.init()
        self.info = info.uppercased()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(number, forKey: "number")
        aCoder.encode(info, forKey: "info")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.number = aDecoder.decodeInteger(forKey: "number")
        self.info = aDecoder.decodeObject(forKey: "info") as! String
    }
}
