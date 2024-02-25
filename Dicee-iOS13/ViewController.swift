//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    var numberOfRolls = 0;
    
    let diceImageViews: [UIImage] = [
        UIImage(imageLiteralResourceName: "DiceOne"),
        UIImage(imageLiteralResourceName: "DiceTwo"),
        UIImage(imageLiteralResourceName: "DiceThree"),
        UIImage(imageLiteralResourceName: "DiceFour"),
        UIImage(imageLiteralResourceName: "DiceFive"),
        UIImage(imageLiteralResourceName: "DiceSix"),
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getNewDices();
    }
    
    func getRandomImageDice() -> UIImage {
        return diceImageViews.randomElement()!;
    }
    
    func getNewDices() {
        // Transition for Dice One
        UIView.transition(
            with: diceImageViewOne,
            duration: 0.25,
            options: .transitionCrossDissolve,
            animations: {
                self.diceImageViewOne.image = self.getRandomImageDice();
            },
            completion: nil
        )
        
        // Transition for Dice Two
        UIView.transition(
            with: diceImageViewTwo,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.diceImageViewTwo.image = self.getRandomImageDice();
            },
            completion: nil
        )
        
        getRollButtonText();
        
        // Change Dice without transition
        // diceImageViewOne.image = getRandomImageDice();
        // diceImageViewTwo.image = getRandomImageDice();
    }

    @IBAction func onRoll() {
        imcrementNumberOfRolls();
        getNewDices();
    }
    
    func imcrementNumberOfRolls() {
        numberOfRolls += 1;
    }
    
    func getRollButtonText() {
        if (numberOfRolls > 0) {
            rollButton.setTitle("Roll \(numberOfRolls)", for: .normal);
        } else {
            rollButton.setTitle("Try your lucky here", for: .normal);
        }
    }
    
}

