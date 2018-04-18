//
//  CrosswordStore.swift
//  crosswords_generator
//
//  Created by Devontae Reid on 4/17/18.
//  Copyright © 2018 Maxim Bilan. All rights reserved.
//

import UIKit

class CrosswordStore: NSObject {
    var crossword: Crossword!
    var level = 1
    
    let puzzlesArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("level1.plist")
    }()
    
    override init() {
        if let archivedCrossword =
            NSKeyedUnarchiver.unarchiveObject(withFile: puzzlesArchiveURL.path) as? Crossword {
            crossword = archivedCrossword
        }
    }
    
    
    func saveChanges() -> Bool {
        // Sort the places in alphabetical order
//        allWords = allWords.sorted(by: { ($0.title,$0.startDate) < ($1.title,$1.startDate) })
        
        print("Saving items to: \(puzzlesArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(crossword, toFile: puzzlesArchiveURL.path)
    }
}
