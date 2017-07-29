//
//  ViewController.swift
//  NotCalculator
//
//  Created by Елена Яновская on 22.07.17.
//  Copyright © 2017 Елена Яновская. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var digit: Double = 1
    var firstNumber: Double = 0
    var result: Double = 0
    var character: Double = 0
    var secondNumber: Double = 0
    var quantityOfZeros = 0
    var numbersDictionary = [UIButton: Int]()
    var plusButtonIsPushed = false
    var resultButtonIsPushed = false
    var minusButtonIsPushed = false
    var commaButtonIsPushed = false
    var someCharacterIsPushed = false
    var oopsButtonIsPushed = false
    var rootButtonIsPushed = false
    var multiplierButtonIsPushed = false
    var divisorButtonIsPushed = false
    
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
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeAllButtonNotPushed() {
        plusButtonIsPushed = false
        resultButtonIsPushed = false
        minusButtonIsPushed = false
        commaButtonIsPushed = false
        someCharacterIsPushed = false
        oopsButtonIsPushed = false
        rootButtonIsPushed = false
        multiplierButtonIsPushed = false
        divisorButtonIsPushed = false
    }
    
    func calculatePreviousResult() {
        if oopsButtonIsPushed == true {
            print("print oops")
            result = 0
            firstNumber = 0
            commaButtonIsPushed = false
            someCharacterIsPushed = false
            resultButtonIsPushed = false
        }
        if plusButtonIsPushed == true {
            print("secondNum ", secondNumber)
            print("first num ", firstNumber)
            firstNumber += secondNumber
            result = firstNumber
        }
        if minusButtonIsPushed == true {
            print("fn", firstNumber)
            print("Sn", secondNumber)
            firstNumber -= secondNumber
            result = firstNumber
            print(result)
            print("calculate for minus")
        }
        if multiplierButtonIsPushed == true {
            print("secondNum ", secondNumber)
            print("first num ", firstNumber)
            firstNumber *= secondNumber
            result = firstNumber
            print("first num ", firstNumber)
        }
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            print(result.truncatingRemainder(dividingBy: 1))
            print("целое")
            resultLabel.text = String(Int(result))
        }
        else {
            print(result.truncatingRemainder(dividingBy: 1))
            print("first num ", firstNumber)
            print(firstNumber.truncatingRemainder(dividingBy: 1))
            resultLabel.text = String(result)
            print("не целое")
        }
        secondNumber = 0
    }
    
    //MARK: - IBActions
    @IBAction func characterButtonPushed(_ sender: UIButton) {
        numbersDictionary = [zeroButton: 0, oneButton: 1, twoButton: 2, threeButton: 3, fourButton: 4, fiveButton: 5, sixButton: 6, sevenButton: 7, eightButton: 8, nineButton: 9]
        for (key, value) in numbersDictionary {
            if sender == key {
                if plusButtonIsPushed || minusButtonIsPushed || multiplierButtonIsPushed {
                    if commaButtonIsPushed == false {
                        secondNumber *= 10
                        self.character = Double(value)
                        secondNumber += character
                        result = secondNumber
                        resultLabel.text = String(Int(result))
                    }
                    if commaButtonIsPushed == true {
                        digit *= 0.1
                        self.character = Double(value)
                        character *= digit
                        secondNumber += character
                        result = secondNumber
                        if character == 0 {
                            if digit == 0.1 {
                                resultLabel.text = String(Int(result))
                                resultLabel.text? += ".0"
                            }
                            if digit < 0.1 {
                                resultLabel.text? += "0"
                                print("am here")
                            }
                        }
                        if character != 0 {
                            resultLabel.text = String(result)
                        }
                    }
                }
                else {
                    if resultButtonIsPushed == true {
                        firstNumber = 0
                        resultButtonIsPushed = false
                    }
                    if commaButtonIsPushed == true {
                        self.character = Double(value)
                        digit *= 0.1
                        character *= digit
                        firstNumber += character
                        result = firstNumber
                        print(character)
                        if character == 0 {
                            if digit == 0.1 {
                                resultLabel.text = String(Int(result))
                                resultLabel.text? += ".0"                            }
                            if digit < 0.1 {
                                resultLabel.text? += "0"
                            }
                        }
                        if character != 0 {
                            resultLabel.text = String(result)
                        }
                        
                    }
                    if commaButtonIsPushed == false {
                        self.character = Double(value)
                        firstNumber *= 10
                        firstNumber += character
                        result = firstNumber
                        resultLabel.text = String(Int(result))
                    }
                }
            }
        }
        print("secondNum ", secondNumber)
        print("first num ", firstNumber)
        someCharacterIsPushed = true
        oopsButtonIsPushed = false
    }
    
    @IBAction func plusButtonPushed(_ sender: Any) {
        calculatePreviousResult()
        makeAllButtonNotPushed()
        plusButtonIsPushed = true
        digit = 1
    }

    @IBAction func minusButtonPushed(_ sender: Any) {
        calculatePreviousResult()
        makeAllButtonNotPushed()
        minusButtonIsPushed = true
        digit = 1
    }
    
    @IBAction func multiplierButtonIsPushed(_ sender: Any) {
        calculatePreviousResult()
        makeAllButtonNotPushed()
        multiplierButtonIsPushed = true
        digit = 1
        
    }
    
    @IBAction func resultButtonPushed(_ sender: Any) {
        oopsButtonIsPushed = false
        calculatePreviousResult()
        makeAllButtonNotPushed()
        resultButtonIsPushed = true
    }
    
    @IBAction func oopsButtonPushed(_ sender: Any) {
        if oopsButtonIsPushed == true || (plusButtonIsPushed == false && minusButtonIsPushed == false && multiplierButtonIsPushed == false && divisorButtonIsPushed == false && resultButtonIsPushed == false) {
            result = 0
            firstNumber = 0
            commaButtonIsPushed = false
            someCharacterIsPushed = false
            resultButtonIsPushed = false
            print("all cancel")
        }
        secondNumber = 0
        resultLabel.text = "0"
        someCharacterIsPushed = false
        oopsButtonIsPushed = true
        commaButtonIsPushed = false
        digit = 1
        print("cancel")
    }
    
    @IBAction func commaButtonPushed(_ sender: Any) {
        if commaButtonIsPushed == false {
            if someCharacterIsPushed == true {
                resultLabel.text = String(Int(result)) + "."
                digit = 1
            }
            if someCharacterIsPushed == false {
                resultLabel.text = String(0) + "."
                if plusButtonIsPushed || minusButtonIsPushed || multiplierButtonIsPushed {
                    secondNumber = 0
                }
                else {
                    firstNumber = 0
                    digit = 1
                }
            }
        }
        commaButtonIsPushed = true
    }
    
}

