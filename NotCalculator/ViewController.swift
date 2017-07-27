//
//  ViewController.swift
//  NotCalculator
//
//  Created by Елена Яновская on 22.07.17.
//  Copyright © 2017 Елена Яновская. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNubmer = 0
    var result = 0
    var character = 0
    var secondNumber = 0
    var numbersDictionary = [UIButton: Int]()
    var plusButtonIsPushed = false
    var resultButtonIsPushed = false
    var minusButtonIsPushed = false
    
    //MARK: - IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var oopsButton: UIButton!
    @IBOutlet var rootButton: UIButton!
    @IBOutlet var divisorButton: UIButton!
    @IBOutlet var multiplierButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var commaButton: UIButton!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBActions
    @IBAction func pushButton(_ sender: UIButton) {
        numbersDictionary = [oneButton: 1, twoButton: 2]
        for (key, value) in numbersDictionary {
            if sender == key {
                if plusButtonIsPushed == true || minusButtonIsPushed == true {
                    print("plusButtonIsPushed == true || minusButtonIsPushed == true")
                    print(secondNumber)
                    secondNumber *= 10
                    self.character = value
                    secondNumber += character
                    print(secondNumber)
                    print()
                    resultLabel.text = String(secondNumber)
                    print(secondNumber)
                }
                if plusButtonIsPushed == false && minusButtonIsPushed == false {
                    if resultButtonIsPushed == true {
                        firstNubmer = 0
                        resultButtonIsPushed = false
                    }
                    
                    firstNubmer *= 10
                    self.character = value
                    firstNubmer += character
                    result = firstNubmer
                    resultLabel.text = String(result)
                }
            }
        }
    }
    
    @IBAction func plusButtonPushed(_ sender: Any) {
        if plusButtonIsPushed == true {
            firstNubmer += secondNumber
            result = firstNubmer
        }
        if minusButtonIsPushed == true {
            firstNubmer -= secondNumber
            result = firstNubmer
        }
        resultLabel.text = String(result)
        plusButtonIsPushed = true
        minusButtonIsPushed = false
        resultButtonIsPushed = false
        secondNumber = 0
    }

    @IBAction func resultButtonPushed(_ sender: Any) {
        if plusButtonIsPushed == true {
            firstNubmer += secondNumber
            result = firstNubmer
        }
        if minusButtonIsPushed == true {
            firstNubmer -= secondNumber
            result = firstNubmer
        }
        resultLabel.text = String(result)
        secondNumber = 0
        plusButtonIsPushed = false
        minusButtonIsPushed = false
        resultButtonIsPushed = true
    }
    
    @IBAction func oopsButtonPushed(_ sender: Any) {
        result = 0
        firstNubmer = 0
        secondNumber = 0
        plusButtonIsPushed = false
        minusButtonIsPushed = false
        resultButtonIsPushed = false
        resultLabel.text = "0"
    }
    
    @IBAction func minusButtonPushed(_ sender: Any) {
        if plusButtonIsPushed == true {
            firstNubmer += secondNumber
            result = firstNubmer
        }
        if minusButtonIsPushed == true {
            firstNubmer -= secondNumber
            result = firstNubmer
        }
        resultLabel.text = String(result)
        plusButtonIsPushed = false
        resultButtonIsPushed = false
        minusButtonIsPushed = true
        secondNumber = 0
        print(secondNumber)
    }
}

