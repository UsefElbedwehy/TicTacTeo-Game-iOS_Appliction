//
//  ViewController.swift
//  TicTacTeo-Game
//
//  Created by Uef on 09/01/2025.
//

import UIKit

class ViewController: UIViewController {
    enum Turn {
    case Cross
    case Nought
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1Btn: UIButton!
    @IBOutlet weak var a2Btn: UIButton!
    @IBOutlet weak var a3Btn: UIButton!
    
    @IBOutlet weak var b1Btn: UIButton!
    @IBOutlet weak var b2Btn: UIButton!
    @IBOutlet weak var b3Btn: UIButton!
    
    @IBOutlet weak var c1Btn: UIButton!
    @IBOutlet weak var c2Btn: UIButton!
    @IBOutlet weak var c3Btn: UIButton!
    
    var firstTurn   = Turn.Cross
    var currentTurn = Turn.Cross
    
    let CROSS  = "X"
    let NOUGHT = "O"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
    }
    
    func addToBoard(_ sender: UIButton){
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.Cross {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
                
            }else if currentTurn == Turn.Nought {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
                
            }
        }
    }
    
}

