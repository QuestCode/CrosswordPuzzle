//
//  CrossKeyboard.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/16/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class CrossKeyboard: UIView {
    
    public var letterBttn: LetterButton!
    
    public var bgColor: UIColor = UIColor.black {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    public var bgLetterColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }
    
    public var letterColor: UIColor = UIColor.blue {
        didSet {
            setupView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    
    private func setupView() {
        self.backgroundColor = bgColor
        
        var topRowBttns: [UIButton] = [UIButton]()
        let topRowLetters = ["Q","W","E","R","T","Y","U","I","O","P"]
        for letter in topRowLetters {
            let bttn = UIButton()
            bttn.layer.borderWidth = 2
            bttn.layer.borderColor = letterColor.cgColor
            bttn.layer.cornerRadius = 10
            bttn.layer.masksToBounds = true
            bttn.backgroundColor = bgLetterColor
            bttn.setTitleColor(letterColor, for: .normal)
            bttn.setTitle(letter, for: .normal)
            bttn.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
            topRowBttns.append(bttn)
        }
        let topRow = UIStackView(arrangedSubviews: topRowBttns)
        topRow.distribution = .equalCentering
        topRow.axis = .horizontal
        
        var midRowBttns: [UIButton] = [UIButton]()
        let midRowLetters = ["A","S","D","F","G","H","J","K","L"]
        for letter in midRowLetters {
            let bttn = UIButton()
            bttn.backgroundColor = bgColor
            bttn.layer.borderWidth = 2
            bttn.layer.borderColor = letterColor.cgColor
            bttn.layer.cornerRadius = 10
            bttn.layer.masksToBounds = true
            bttn.backgroundColor = bgLetterColor
            bttn.setTitleColor(letterColor, for: .normal)
            bttn.setTitle(letter, for: .normal)
            bttn.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
            midRowBttns.append(bttn)
        }
        let midRow = UIStackView(arrangedSubviews: midRowBttns)
        midRow.distribution = .equalCentering
        midRow.axis = .horizontal
        
        var botRowBttns: [UIButton] = [UIButton]()
        let botRowLetters = ["Z","X","C","V","B","N","M"]
        for letter in botRowLetters {
            let bttn = UIButton()
            bttn.backgroundColor = bgColor
            bttn.layer.borderWidth = 2
            bttn.layer.borderColor = letterColor.cgColor
            bttn.layer.cornerRadius = 10
            bttn.layer.masksToBounds = true
            bttn.backgroundColor = bgLetterColor
            bttn.setTitleColor(letterColor, for: .normal)
            bttn.setTitle(letter, for: .normal)
            bttn.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
            botRowBttns.append(bttn)
        }
        let botRow = UIStackView(arrangedSubviews: botRowBttns)
        botRow.distribution = .fillEqually
        botRow.axis = .horizontal
        
        let vertStackView = UIStackView(arrangedSubviews: [topRow,midRow,botRow])
        vertStackView.distribution = .fillEqually
        vertStackView.axis = .vertical
        vertStackView.alignment = .center
        vertStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(vertStackView)
        
        
        vertStackView.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        vertStackView.rightAnchor.constraint(equalTo: rightAnchor,constant: -30).isActive = true
        vertStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        vertStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    @objc private func tappedButton(_ sender: UIButton) {
        
        if letterBttn != nil && letterBttn.isSelected {
            let string: String = (sender.titleLabel?.text)!
            letterBttn.isSelected = false
            letterBttn.bgColor = .white
            letterBttn.borderColor = UIColor(rgb: 0x89CFF0)
            letterBttn.title = string
        }
    }

}
