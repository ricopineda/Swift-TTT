//
//  ViewController.swift
//  TTT
//
//  Created by Enrico Pineda on 9/7/17.
//  Copyright © 2017 Enrico Pineda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    

    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winCombo = [[0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    @IBAction func squareIsPressed(_ sender: UIButton) {
//        sender.backgroundColor = UIColor.blue
//        sender.backgroundColor = UIColor.red
        if (gameState[sender.tag-1] == 0){
            
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1){
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "circle.jpeg"), for: UIControlState())
                activePlayer = 1
            }
        }
        for combination in winCombo{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1{
                    //cross won
                    winnerLabel.text = "cross wins"
                    print("cross wins")
                }
                else{
                    //circle won
                    winnerLabel.text = "circle wins"
                    print("circle wins")
                }
                resetButton.isHidden = false
                winnerLabel.isHidden = false
            }
        }
        gameIsActive = false
        
        for i in gameState{
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false{
            winnerLabel.text = "Its a DRAW"
            winnerLabel.isHidden = false
            resetButton.isHidden = false
            print("draw")
        }
        
    }
    
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func resetIsPressed(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        resetButton.isHidden = true
        winnerLabel.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

