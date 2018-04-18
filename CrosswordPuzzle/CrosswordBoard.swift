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
    
    public var lines: [String] = [String]() {
        didSet {
            setupView()
        }
    }
    
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
        
        var rowButtons: [LetterButton] = [LetterButton]()
        
        for m in 0..<boardSize {
            if lines.count > 0 {
                let line = lines[m].uppercased()
                let characters = Array(line)
                rowButtons.removeAll()
                for n in 0..<boardSize {
                    let bttn = LetterButton()
                    bttn.buttonWidthHeight = self.frame.height /  (CGFloat)(boardSize)
                    bttn.columnNumber = n
                    bttn.rowNumber = m
                    bttn.borderColor = UIColor(rgb: 0x89CFF0)
                    bttn.shouldBeTitle = "\(characters[n])"
                    bttn.title = "\(characters[n])"
                    /*****************************************
                     *                                       *
                     *                TESTING                *
                     *                                       *
                     *****************************************/
                    
                    if bttn.shouldBeTitle == "-" {
                        bttn.title = ""
                        bttn.isEnabled = false
                        bttn.bgColor = UIColor.clear
                        bttn.borderColor = UIColor.clear
                    }
                    
                    
                    
                    // Correct String
                    if bttn.shouldBeTitle == bttn.title {
                        bttn.borderColor = UIColor(rgb: 0x228B22)
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
            
    }
    
    private func emptyStack() {
        for view in vertStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
//        rowButtons.removeAll()
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
