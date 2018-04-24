//
//  ViewController.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var crosswordBoard: CrosswordBoard!
    var hintView: HintView!
    var keyboard: CrossKeyboard!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var crosswordStore = CrosswordStore()
        if crosswordStore.crossword == nil {
            let _ = LevelCreater()
            crosswordStore = CrosswordStore()
        }
        
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = #imageLiteral(resourceName: "beach")
        view.addSubview(imageView)
        
        crosswordBoard = CrosswordBoard()
        crosswordBoard.lines = crosswordStore.crossword.lines
        crosswordBoard.words = crosswordStore.crossword.allWords
        crosswordBoard.boardSize = 10
        crosswordBoard.setContentHuggingPriority(.defaultHigh, for: .vertical)
        crosswordBoard.delegate = self
        
        hintView = HintView()
        hintView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        hintView.translatesAutoresizingMaskIntoConstraints = false
        hintView.bgColor = UIColor.clear
        var words = [Word]()
        for word in crosswordStore.crossword.allWords {
            print("Hint: \(word.hint.info)")
            
            words.append(word)
        }
        hintView.words = words

        
        
        keyboard = CrossKeyboard()
        keyboard.delegate = self
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.setContentHuggingPriority(.defaultLow, for: .vertical)
        keyboard.bgColor = .clear
//        keyboard.letterColor = UIColor(rgb: 0x89CFF0)
    
        
        let margins = view.layoutMarginsGuide
        let vertStackView = UIStackView(arrangedSubviews: [crosswordBoard,hintView,keyboard])
        vertStackView.distribution = .fill
        vertStackView.spacing = 15
//        vertStackView.alignment = .fill
        vertStackView.axis = .vertical
        vertStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vertStackView)
        
        
        hintView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        keyboard.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        vertStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5).isActive = true
        vertStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -5).isActive = true
        vertStackView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        vertStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: CrosswordBoardDelegate, KeyboardDelegate {
    func set(selectedBttn: LetterButton) {
        selectedBttn.bgColor = UIColor(rgb: 0x89CFF0)
        selectedBttn.borderColor = .white
        keyboard.letterBttn = selectedBttn
    }
    
    // Move to next button in row or column
    func moveToNextIndex(selectedRow: Int,selectedColumn: Int) {
        if crosswordBoard.rowWord {
            let rowStackView = crosswordBoard.rowOfButtons[selectedRow]
            // Iterate through row
            for view in rowStackView.arrangedSubviews {
                let bttn = view as! LetterButton
                if bttn.isEnabled && bttn.columnNumber == selectedColumn + 1 {
                    bttn.sendActions(for: .touchUpInside)
                }
            }
        } else {
            // Iterate through stackviews array to find button for every button in column
            for stackView in crosswordBoard.rowOfButtons {
                let bttn = stackView.arrangedSubviews[selectedColumn] as! LetterButton
                if bttn.isEnabled && bttn.rowNumber == selectedRow + 1 {
                    bttn.sendActions(for: .touchUpInside)
                }
            }
        }
    }
    
}

