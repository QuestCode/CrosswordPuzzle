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
    
    
    let hints = [Hint(number: 1, info: "Latest Football Champions"),Hint(number: 2, info: "Fastest Linebacker"),Hint(number: 3, info: "Philadelphia Basketball Team")]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = #imageLiteral(resourceName: "beach")
        view.addSubview(imageView)
        
        crosswordBoard = CrosswordBoard()
        crosswordBoard.boardSize = 13
        crosswordBoard.setContentHuggingPriority(.defaultHigh, for: .vertical)
        crosswordBoard.delegate = self
        
        hintView = HintView()
        hintView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        hintView.bgColor = UIColor.clear
        hintView.hints = hints

        
        
        keyboard = CrossKeyboard()
        keyboard.setContentHuggingPriority(.defaultLow, for: .vertical)
        keyboard.bgColor = .clear
    
        
        let margins = view.layoutMarginsGuide
        let vertStackView = UIStackView(arrangedSubviews: [crosswordBoard,hintView,keyboard])
        vertStackView.distribution = .fill
        vertStackView.spacing = 15
//        vertStackView.alignment = .fill
        vertStackView.axis = .vertical
        vertStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vertStackView)
        
        
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


extension ViewController: CrosswordBoardDelegate {
    func set(selectedBttn: LetterButton) {
        selectedBttn.bgColor = UIColor(rgb: 0x89CFF0)
        selectedBttn.borderColor = .white
        keyboard.letterBttn = selectedBttn
    }
    
    
}

