//
//  LevelCollectionViewCell.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/25/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    private var titleLabel = UILabel()
    private let bgImageView = UIImageView()
    private let overlayView = UIView()
    
    
    public var level: Level = Level(title: "", color: UIColor.black,
                                    puzzle: Puzzle()) {
        didSet {
            bgImageView.image = UIImage(named: level.title.uppercased())
            overlayView.backgroundColor = level.color.withAlphaComponent(0.5)
            titleLabelColor()
            titleLabel.text = level.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        layer.cornerRadius = 7.0
        clipsToBounds = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabelColor()
        
        addSubview(bgImageView)
        addSubview(overlayView)
        addSubview(titleLabel)
        
        titleLabel.textAlignment = .center
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100) // 50 percent of the view height
        
        bgImageView.clipsToBounds = true
        bgImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        overlayView.clipsToBounds = true
        overlayView.backgroundColor = level.color.withAlphaComponent(0.5)
        overlayView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        overlayView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        overlayView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    private func titleLabelColor() {
        let ciColor = CIColor(color: level.color)
        
        let newRed = 1.0 - ciColor.red
        let newGreen = 1.0 - ciColor.green
        let newBlue = 1.0 - ciColor.blue
        
        let textColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        titleLabel.textColor = textColor
    }
}
