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
    
    var btns:[UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initBtnsArray()
    }
    func initBtnsArray(){
        btns.append(a1Btn)
        btns.append(a2Btn)
        btns.append(a3Btn)
        
        btns.append(b1Btn)
        btns.append(b2Btn)
        btns.append(b3Btn)
        
        btns.append(c1Btn)
        btns.append(c2Btn)
        btns.append(c3Btn)
    }
    func isFullBoard() -> Bool {
        for btn in btns {
            if btn.title(for: .normal) == nil {
                return false
            }
        }
        resetBoard()
        return true
    }
    func resetBoard()  {
        for btn in btns {
            btn.isEnabled = true
            btn.setTitle(nil, for: .normal)
        }
        
        if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            currentTurn = Turn.Nought
        }
        
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            currentTurn = Turn.Cross
        }
    }
    func checkVectory(_ shape: String)->Bool{
        if a1Btn.title(for: .normal) == shape && a2Btn.title(for: .normal) == shape && a3Btn.title(for: .normal) == shape {
            return true
        }else if b1Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && b3Btn.title(for: .normal) == shape {
            return true
        }else if c1Btn.title(for: .normal) == shape && c2Btn.title(for: .normal) == shape && c3Btn.title(for: .normal) == shape {
            return true
        }
        
        if a1Btn.title(for: .normal) == shape && b1Btn.title(for: .normal) == shape && c1Btn.title(for: .normal) == shape {
            return true
        }else if a2Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && c2Btn.title(for: .normal) == shape {
            return true
        }else if a3Btn.title(for: .normal) == shape && b3Btn.title(for: .normal) == shape && c3Btn.title(for: .normal) == shape {
            return true
        }
        
        if a1Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && c3Btn.title(for: .normal) == shape {
            return true
        }else if a3Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && c1Btn.title(for: .normal) == shape {
            return true
        }
        
        return false
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkVectory(CROSS) {
            resetBoard()
            print("Cross wins!")
        }
        if checkVectory(NOUGHT) {
            resetBoard()
            print("Nought wins!")
        }
        if isFullBoard() {
            resetBoard()
            print("Drew!")
        }
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
            sender.isEnabled = false
        }
    }
    
}

