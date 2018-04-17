//
//  HintView.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/16/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class HintView: UIView {
    
    private let hintLabel = UILabel()
    private let wordNumberLabel = UILabel()
    
    public var bgColor: UIColor = UIColor.black {
        didSet {
            setupView()
        }
    }
    
    public var wordNumber: String = "" {
        didSet {
            setupView()
        }
    }
    
    public var hint: String = "" {
        didSet {
            setupView()
        }
    }
    
    
    
    
    private func setupView() {
        self.backgroundColor = bgColor
        
        let ciColor = CIColor(color: bgColor)
        
        let newRed = 1.0 - ciColor.red
        let newGreen = 1.0 - ciColor.green
        let newBlue = 1.0 - ciColor.blue
        
        let textColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        
        // Word Number
        wordNumberLabel.text = wordNumber
        wordNumberLabel.textColor = textColor
        wordNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(wordNumberLabel)
        
        wordNumberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        wordNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        wordNumberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        wordNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        // Hint Label
        hintLabel.textColor = textColor
        hintLabel.numberOfLines = 0
        hintLabel.textAlignment = .center
        hintLabel.text = hint
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hintLabel)
        
        hintLabel.leftAnchor.constraint(equalTo: wordNumberLabel.rightAnchor, constant: 10).isActive = true
        hintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        hintLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        hintLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
}
