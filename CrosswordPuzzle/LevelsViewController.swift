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
        Level(title: "Basketball", color: UIColor(red: 1, green: 25, blue: 54), puzzle: Puzzle(level: "basketballLevel")),
        Level(title: "Football", color: UIColor(red: 1, green: 25, blue: 54), puzzle: Puzzle(level: "footballLevel")),
        Level(title: "Soccer", color: UIColor(red: 1, green: 25, blue: 54), puzzle: Puzzle(level: "soccerLevel")),
        Level(title: "Philly Sports", color: UIColor(red: 1, green: 25, blue: 54), puzzle: Puzzle(level: "phillySportsLevel")),
        Level(title: "Los Angeles Sports", color: UIColor(red: 1, green: 25, blue: 54), puzzle: Puzzle(level: "laSportsLevel"))
    ]
    
    
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = #imageLiteral(resourceName: "beach")
        view.addSubview(imageView)
        
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! LevelCollectionViewCell
        cell.level = levels[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gVC = GameViewController()
        gVC.puzzle = levels[indexPath.row].puzzle
        present(gVC, animated: true, completion: nil)
    }
}
