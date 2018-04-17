//
//  LetterButton.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class LetterButton: UIButton {
    
    public var rowNumber: Int = 0 {
        didSet{
            setupButton()
        }
    }
    
    public var columnNumber: Int = 0 {
        didSet{
            setupButton()
        }
    }
    
    public var shouldBeTitle = "" {
        didSet {
            setupButton()
        }
    }
    
    public var title: String = "" {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    public var titleColor: UIColor = UIColor.black {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    public var wordNumber: String = "" {
        didSet {
            setupButton()
        }
    }
    
    public var borderColor: UIColor = UIColor.blue {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    public var bgColor: UIColor = UIColor.white {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    public var buttonWidthHeight: CGFloat = 40 {
        didSet {
            setupButton()
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        
        // Number label to show start of word
        let numberLabel = UILabel()
        numberLabel.text = wordNumber
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.font = UIFont.systemFont(ofSize: 6)
        self.addSubview(numberLabel)
        
        numberLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        numberLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = bgColor
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor.cgColor
        self.frame.size = CGSize(width: buttonWidthHeight, height: buttonWidthHeight)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
}
