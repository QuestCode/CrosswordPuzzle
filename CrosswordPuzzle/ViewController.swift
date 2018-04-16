//
//  ViewController.swift
//  CrosswordPuzzle
//
//  Created by Devontae Reid on 4/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
//        let margins = view.layoutMarginsGuide
        
        let crossword = CrosswordBoard(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height/2))
        
        view.addSubview(crossword)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

