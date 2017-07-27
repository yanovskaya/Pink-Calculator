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
                if plusButtonIsPushed == false {
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
                else {
                    secondNumber *= 10
                    self.character = value
                    secondNumber += character
                    resultLabel.text = String(secondNumber)
                }
            }
        }
    }
    
    @IBAction func pushPlusButton(_ sender: Any) {
        if plusButtonIsPushed == true {
            firstNubmer += secondNumber
            result = firstNubmer
        }
        resultLabel.text = String(result)
        plusButtonIsPushed = true
        secondNumber = 0
    }

    @IBAction func pushResultButton(_ sender: Any) {
        if plusButtonIsPushed == true {
            firstNubmer += secondNumber
            result = firstNubmer
        }
        resultLabel.text = String(result)
        secondNumber = 0
        plusButtonIsPushed = false
        resultButtonIsPushed = true
    }
    
    @IBAction func oopsButtonPushed(_ sender: Any) {
        result = 0
        firstNubmer = 0
        secondNumber = 0
        plusButtonIsPushed = false
        resultButtonIsPushed = false
        resultLabel.text = "0"
    }
}

