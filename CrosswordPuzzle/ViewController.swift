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
    
    let hints = ["Latest Football Champions","Fastest Linebacker","Philadelphia Basketball Team"]
    let numbers = [1,2,3]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
//        let margins = view.layoutMarginsGuide
        
        let crossword = CrosswordBoard(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height/2))
        
        hintView = HintView(frame: CGRect(x: 0, y: view.frame.height/2 + 30, width: view.frame.width, height: view.frame.height/8))
        hintView.bgColor = UIColor(rgb: 0xa9a9a9)
        hintView.wordNumber = "\(numbers[currentIndex])"
        hintView.hint = hints[currentIndex]
        
        let prevBttn = UIButton(frame: CGRect(x: 0, y: 0 , width: 30, height: hintView.frame.height))
        prevBttn.setTitle("Previous", for: .normal)
        prevBttn.addTarget(self, action: #selector(prevNextHint(_:)), for: .touchUpInside)
        
        let nextBttn = UIButton(frame: CGRect(x: hintView.frame.width - 30, y: 0 , width: 30, height: hintView.frame.height))
        nextBttn.setTitle("Next", for: .normal)
        nextBttn.addTarget(self, action: #selector(prevNextHint(_:)), for: .touchUpInside)
        
        hintView.addSubview(prevBttn)
        hintView.addSubview(nextBttn)
        view.addSubview(hintView)
        view.addSubview(crossword)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc private func prevNextHint(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "Next" {
            currentIndex += 1
            if currentIndex >= hints.count {
                currentIndex = 0
            }
            hintView.wordNumber = "\(numbers[currentIndex])"
            hintView.hint = hints[currentIndex]
        } else if sender.titleLabel?.text == "Previous" {
            currentIndex -= 1
            if currentIndex < 0 {
                currentIndex = hints.count - 1
            }
            hintView.wordNumber = "\(numbers[currentIndex])"
            hintView.hint = hints[currentIndex]
        }
    }

}

