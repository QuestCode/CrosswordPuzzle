//
//  ViewController.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    public var puzzle: Puzzle!
    private var crosswordBoard: CrosswordBoard!
    private var hintView: HintView!
    private var keyboard: CrossKeyboard!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if puzzle != nil {
            setupViewController()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("memory warning")
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViewController() {
        let imageView = UIImageView(frame: view.frame)
        imageView.image = #imageLiteral(resourceName: "beach")
        view.addSubview(imageView)
        
        crosswordBoard = CrosswordBoard()
        crosswordBoard.translatesAutoresizingMaskIntoConstraints = false
        crosswordBoard.lines = puzzle.lines
        crosswordBoard.words = puzzle.words
        crosswordBoard.boardSize = 10
        crosswordBoard.setContentHuggingPriority(.defaultHigh, for: .vertical)
        crosswordBoard.delegate = self
        
        var words = [Word]()
        for word in puzzle.words { words.append(word) }
        hintView = HintView()
        hintView.delegate = self
        hintView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        hintView.translatesAutoresizingMaskIntoConstraints = false
        hintView.bgColor = UIColor.clear
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
        vertStackView.axis = .vertical
        vertStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vertStackView)
        
        hintView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        keyboard.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        vertStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5).isActive = true
        vertStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -5).isActive = true
        vertStackView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        vertStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

}


extension GameViewController: CrosswordBoardDelegate {
    func set(selectedBttn: LetterButton) {
        selectedBttn.bgColor = UIColor(rgb: 0x89CFF0)
        selectedBttn.borderColor = .white
        keyboard.letterBttn = selectedBttn
    }
}

extension GameViewController: HintDelegate {
    func selectWord(columnNumber: Int, rowNumber: Int) {
        let rowStackView = crosswordBoard.rowOfButtons[rowNumber-1]
        let bttn = rowStackView.arrangedSubviews[columnNumber-1] as! LetterButton
        if bttn.isEnabled  {
            bttn.sendActions(for: .touchUpInside)
        }
    }
}

extension GameViewController: KeyboardDelegate {

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
    
    func moveBackAnIndex(selectedRow: Int, selectedColumn: Int) {
        if crosswordBoard.rowWord {
            let rowStackView = crosswordBoard.rowOfButtons[selectedRow]
            // Iterate through row
            for view in rowStackView.arrangedSubviews {
                let bttn = view as! LetterButton
                if bttn.isEnabled && bttn.columnNumber == selectedColumn {
                    bttn.title = ""
                } else if bttn.isEnabled && bttn.columnNumber == selectedColumn - 1 {
                    bttn.sendActions(for: .touchUpInside)
                }
            }
        } else {
            // Iterate through stackviews array to find button for every button in column
            for stackView in crosswordBoard.rowOfButtons {
                let bttn = stackView.arrangedSubviews[selectedColumn] as! LetterButton
                if bttn.isEnabled && bttn.rowNumber == selectedRow {
                    bttn.title = ""
                } else if bttn.isEnabled && bttn.columnNumber == selectedRow - 1 {
                    bttn.sendActions(for: .touchUpInside)
                }
            }
        }
    }
    
    func returnHome() {
        showHomeAlert(withTitle: "Go Home", message: "Are you sure you want to go home?") { (action) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func showHomeAlert(withTitle title: String, message: String, action: @escaping (UIAlertAction) -> Void ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Yes", style: .default, handler: action)
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true, completion: nil)
    }
}

