//
//  ViewController.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hintView: HintView!
    
    
    let hints = [Hint(number: 1, info: "Latest Football Champions"),Hint(number: 2, info: "Fastest Linebacker"),Hint(number: 3, info: "Philadelphia Basketball Team")]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
//        let margins = view.layoutMarginsGuide
        
        let crossword = CrosswordBoard(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height/2))
        
        hintView = HintView(frame: CGRect(x: 0, y: view.frame.height/2 + 30, width: view.frame.width, height: view.frame.height/8))
        hintView.bgColor = UIColor(rgb: 0xa9a9a9)
        hintView.hints = hints
        
        
        view.addSubview(hintView)
        view.addSubview(crossword)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

