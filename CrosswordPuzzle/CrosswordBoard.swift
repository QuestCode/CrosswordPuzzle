//
//  CrosswordBoard.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

protocol CrosswordBoardDelegate {
    func set(selectedBttn: LetterButton)
}

class CrosswordBoard: UIView {
    
    var delegate: CrosswordBoardDelegate!
    
    var vertStackView = UIStackView()
    
    private var selectedBttns: [LetterButton] = [LetterButton]()
    private var rowButtons: [LetterButton] = [LetterButton]()
    
    public var selectedRow: Int = 0
    public var selectedColumn: Int = 0
    
    
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
                
                if m % 2 == 0 && n % 4 == 0 {
                    bttn.title = ""
                } else if m % 3 == 1 {
                    bttn.wordNumber = "\(m)"
                    bttn.title = "A"
                }
                
                if bttn.title == "" {
                    bttn.isEnabled = false
                    bttn.bgColor = UIColor.clear
                    bttn.borderColor = UIColor.clear
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
    
    private func checkForActiveBttns(selectedBttns:[LetterButton]) {
        for bttn in selectedBttns {
            if bttn.isSelected == true {
                bttn.isSelected = false
                bttn.bgColor = .white
                bttn.borderColor = UIColor(rgb: 0x89CFF0)
            }
        }
        self.selectedBttns.removeAll()
    }
    
    @objc private func bttnClicked(_ sender: LetterButton) {
        checkForActiveBttns(selectedBttns: selectedBttns)
        sender.isSelected = true
        selectedRow = sender.rowNumber
        selectedColumn = sender.columnNumber
        
        selectedBttns.append(sender)
        
        delegate.set(selectedBttn: sender)
    }
    

}
