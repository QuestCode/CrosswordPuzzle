//
//  Hint.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/16/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class Hint: NSObject, NSCoding {
    var numberDirection: String = ""
    var info: String = ""
    
    init(info: String) {
        super.init()
        self.info = info
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(numberDirection, forKey: "numberDirection")
        aCoder.encode(info, forKey: "info")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.numberDirection = aDecoder.decodeObject(forKey: "numberDirection") as! String
        self.info = aDecoder.decodeObject(forKey: "info") as! String
    }
}
