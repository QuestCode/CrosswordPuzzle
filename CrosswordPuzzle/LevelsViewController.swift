//
//  LevelsViewController.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/24/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
    
    let cellID = "levelID"
    
    var levels: [Level] = [
        Level(title: "Basketball", color: UIColor(red: 1, green: 25, blue: 54), crossword: Crossword(allWords: [Word](), lines: [String]())),
        Level(title: "Football", color: UIColor(red: 1, green: 25, blue: 54), crossword: Crossword(allWords: [Word](), lines: [String]())),
        Level(title: "Soccer", color: UIColor(red: 1, green: 25, blue: 54), crossword: Crossword(allWords: [Word](), lines: [String]())),
        Level(title: "Philly Sports", color: UIColor(red: 1, green: 25, blue: 54), crossword: Crossword(allWords: [Word](), lines: [String]())),
        Level(title: "Los Angeles Sports", color: UIColor(red: 1, green: 25, blue: 54), crossword: Crossword(allWords: [Word](), lines: [String]()))
    ]
    
    var colors: [UIColor]  = [
        UIColor(red: 237, green: 37, blue: 78),
        UIColor(red: 249, green: 220, blue: 92),
        UIColor(red: 194, green: 234, blue: 189),
        UIColor(red: 1, green: 25, blue: 54),
        UIColor(red: 255, green: 184, blue: 209)
    ]
    
    
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let columnArray = getDataForCrossword(name: "Column")
//        for item in columnArray {
//            print("Column: \(item)")
//        }
//
//        let rowArray = getDataForCrossword(name: "Row")
//        for item in rowArray {
//            print("Row: \(item)")
//        }
//
//        let hintArray = getDataForCrossword(name: "Hint")
//        for item in hintArray {
//            print("Hint: \(item)")
//        }
//
//        let wordArray = getDataForCrossword(name: "Word")
//        for item in wordArray {
//            print("Word: \(item)")
//        }
//
//        let numberArray = getDataForCrossword(name: "Number")
//        for item in numberArray {
//            print("Number: \(item)")
//        }
//
//        let puzzleArray = getDataForCrossword(name: "Puzzle")
//        for item in puzzleArray {
//            print("Puzzle: \(item)")
//        }
        
        
        
        
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSwiftArrayFromPlist(name: String) -> NSDictionary {
        let path = Bundle.main.path(forResource: name, ofType: "plist")
        return NSDictionary(contentsOfFile: path!)!
    }
    
    func getDataForCrossword(name: String) ->  NSArray {
        let dictionary = getSwiftArrayFromPlist(name: "level1")
        print(dictionary.value(forKey: "Lines"))
        return dictionary[name] as! NSArray
    }
    

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: CardsCollectionViewLayout())
        collectionView.backgroundColor = .blue
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LevelCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
        
        
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }

}

extension LevelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! LevelCollectionViewCell
        cell.level = levels[indexPath.row]
        return cell
    }
}
