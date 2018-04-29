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
    
    public var rowWord = true
    public var selectedBttns: [LetterButton] = [LetterButton]()
    public var rowOfButtons: [UIStackView] = [UIStackView]()
    
    public var words: [Word] = [Word]() {
        didSet {
            setupView()
        }
    }
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
        rowOfButtons = [UIStackView]()
        
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
//                    bttn.title = "\(characters[n])"
                    
                    // Board button that have should be set to - should be inactive and should be invisible
                    if bttn.shouldBeTitle == "-" {
                        bttn.title = ""
                        bttn.isEnabled = false
                        bttn.bgColor = UIColor.clear
                        bttn.borderColor = UIColor.clear
                    }
                    
                    for word in words {
                        if word.column-1 == bttn.columnNumber && word.row-1 == bttn.rowNumber {
                            bttn.wordNumber = "\(word.index)"
                        }
                    }
                    
                    // Assign action to each button
                    bttn.addTarget(self, action: #selector(bttnClicked(_:)), for: .touchUpInside)
                    rowButtons.append(bttn)
                }
                let stackView = UIStackView(arrangedSubviews: rowButtons)
                stackView.axis = .horizontal
                stackView.distribution = .fillEqually
                rowOfButtons.append(stackView)
                vertStackView.addArrangedSubview(stackView)
            }
        }
            
    }
    
    private func emptyStack() {
        for view in vertStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
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
    
    private func selectRowColumn(currentButton: LetterButton) {
        let rowStackView = rowOfButtons[currentButton.rowNumber]
        
        
        // Loop through each row to determine if word is in a row or column
        // Every word is at least 3 letters
        if currentButton.columnNumber > 2 {
            let max = currentButton.columnNumber + 1
            for i in currentButton.columnNumber...max {
                let subviews = rowStackView.arrangedSubviews
                let bttn = subviews[i] as! LetterButton
                let nextBttn = subviews[i+1] as! LetterButton
                
                // Determine if both the button selected and next button is
                // enabled to determine if the word is in a row or column
                if bttn.isEnabled && nextBttn.isEnabled {
                    rowWord = true
                    break
                } else {
                    rowWord = false
                    break
                }
            }
        } else {
            for i in 1...2 {
                let subviews = rowStackView.arrangedSubviews
                let bttn = subviews[i] as! LetterButton
                let nextBttn = subviews[i+1] as! LetterButton
                
                // Determine if both the button selected and next button is
                // enabled to determine if the word is in a row or column
                if bttn.isEnabled && nextBttn.isEnabled {
                    rowWord = true
                    break
                } else {
                    rowWord = false
                    break
                }
            }
        }
        
        // Set the color of selected row of column to green and add
        // selected row or column to selected buttons array
        
        if rowWord {
            // Iterate through row
            for view in rowStackView.arrangedSubviews {
                let bttn = view as! LetterButton
                
                if bttn.isEnabled {
                    bttn.isSelected = true
                    bttn.borderColor = UIColor(rgb: 0x7CFC00)
                    selectedBttns.append(bttn)
                }
            }
        } else {
            // Iterate through stackviews array to find button for every button in column
            for i in 1..<rowOfButtons.count {
                if i+1 != rowOfButtons.count {
                    let bttn = rowOfButtons[i].arrangedSubviews[currentButton.columnNumber] as! LetterButton
                    let nextBttn = rowOfButtons[i+1].arrangedSubviews[currentButton.columnNumber] as! LetterButton
                    if bttn.isEnabled && nextBttn.isEnabled {
                        bttn.isSelected = true
                        bttn.borderColor = UIColor(rgb: 0x7CFC00)
                        selectedBttns.append(bttn)
                        
                        // Check if array already have selected button in it
                        for bttn1 in selectedBttns {
                            if bttn1 != nextBttn {
                                nextBttn.isSelected = true
                                nextBttn.borderColor = UIColor(rgb: 0x7CFC00)
                                selectedBttns.append(nextBttn)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc private func bttnClicked(_ sender: LetterButton) {
        checkForActiveBttns(selectedBttns: selectedBttns)
        sender.isSelected = true
        selectedRow = sender.rowNumber
        selectedColumn = sender.columnNumber
        
        selectedBttns.append(sender)
        selectRowColumn(currentButton: sender)
        delegate.set(selectedBttn: sender)
    }
}
