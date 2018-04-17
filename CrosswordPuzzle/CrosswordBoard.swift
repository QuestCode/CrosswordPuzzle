//
//  CrosswordBoard.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class CrosswordBoard: UIView {
    
    var vertStackView = UIStackView()
    var rowButtons: [LetterButton] = [LetterButton]()
    
    public var boardSize: Int = 10 {
        didSet{
            emptyStack()
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
        

        vertStackView.axis = .vertical
        vertStackView.distribution = .fillEqually
        vertStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(vertStackView)
        
        vertStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        vertStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        vertStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        vertStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        for m in 0..<boardSize {
            rowButtons.removeAll()
            for n in 0..<boardSize {
                let bttn = LetterButton()
                bttn.buttonWidthHeight = self.frame.height /  (CGFloat)(boardSize)
                bttn.columnNumber = n
                bttn.rowNumber = m
                bttn.title = "H"
                bttn.shouldBeTitle = "A"
                bttn.borderColor = UIColor(rgb: 0x89CFF0)
                
                /*****************************************
                 *                                       *
                 *                TESTING                *
                 *                                       *
                 *****************************************/
                
                if m % 3 == 0 && n % 4 == 1 {
                    bttn.title = ""
                } else if m % 3 == 1 {
                    bttn.wordNumber = "\(m)"
                    bttn.title = "A"
                }
                if bttn.title == "" {
                    bttn.bgColor = UIColor.black
                    bttn.borderColor = UIColor.black
                }
                
                
                bttn.addTarget(self, action: #selector(bttnClicked(_:)), for: .touchUpInside)
                rowButtons.append(bttn)
            }
            let stackView = UIStackView(arrangedSubviews: rowButtons)
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            vertStackView.addArrangedSubview(stackView)
        }
            
    }
    
    private func emptyStack() {
        for view in vertStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        rowButtons.removeAll()
    }
    
    @objc private func bttnClicked(_ sender: LetterButton) {
        if sender.title == sender.shouldBeTitle {
            sender.borderColor = UIColor.green
            sender.title = "H"
        } else {
            sender.borderColor = UIColor.red
            sender.title = "A"
        }
        print("Row: \(sender.rowNumber) Column: \(sender.columnNumber)")
    }
    

}
