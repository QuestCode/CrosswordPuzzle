//
//  HintView.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/16/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

protocol HintDelegate {
    func selectWord(columnNumber: Int, rowNumber: Int)
}

class HintView: UIView {
    
    private let hintLabel = UILabel()
    private let wordNumberLabel = UILabel()
    private var currentIndex = 0
    
    public var delegate: HintDelegate!
    
    public var words: [Word] = [Word]() {
        didSet {
            setupView()
        }
    }
    
    public var bgColor: UIColor = UIColor.black {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    private let swipeRight = UISwipeGestureRecognizer()
    private let swipeLeft = UISwipeGestureRecognizer()
    
    private func setupView() {
        let ciColor = CIColor(color: bgColor)
        
        let newRed = 1.0 - ciColor.red
        let newGreen = 1.0 - ciColor.green
        let newBlue = 1.0 - ciColor.blue
        
        let textColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        
        self.backgroundColor = bgColor
        self.layer.borderWidth = 2
        self.layer.borderColor = textColor.cgColor
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        
        
        if words.count > 0 {
            let word = words[currentIndex]
            
            // Word Number
            wordNumberLabel.text = word.hint.numberDirection
            wordNumberLabel.textColor = textColor
            wordNumberLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(wordNumberLabel)
            
            wordNumberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
            wordNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            wordNumberLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
            wordNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            
            // Hint Label
            hintLabel.textColor = textColor
            hintLabel.numberOfLines = 0
            hintLabel.textAlignment = .center
            hintLabel.text = word.hint.info
            hintLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(hintLabel)
            
            hintLabel.leftAnchor.constraint(equalTo: wordNumberLabel.rightAnchor, constant: 10).isActive = true
            hintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
            hintLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
            hintLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
            
            
            swipeRight.addTarget(self, action: #selector(swipeGesture(_:)))
            swipeRight.direction = UISwipeGestureRecognizerDirection.right
            addGestureRecognizer(swipeRight)
            
            swipeLeft.addTarget(self, action: #selector(swipeGesture(_:)))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.left
            addGestureRecognizer(swipeLeft)
        }
    }
    @objc private func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        var column = 0
        var row = 0
        if sender.direction == .right {
            currentIndex += 1
            if currentIndex >= words.count {
                currentIndex = 0
            }
            
            let word = words[currentIndex]
            column = word.column
            row = word.row
            wordNumberLabel.text = word.hint.numberDirection
            hintLabel.text = word.hint.info
        } else if sender.direction == .left {
            currentIndex -= 1
            if currentIndex < 0 {
                currentIndex = words.count - 1
            }
            
            let word = words[currentIndex]
            column = word.column
            row = word.row
            wordNumberLabel.text = word.hint.numberDirection
            hintLabel.text = word.hint.info
        }
        
        delegate.selectWord(columnNumber: column, rowNumber: row)
    }
    
}
