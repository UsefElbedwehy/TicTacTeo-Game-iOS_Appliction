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
    
    var actionCounter = 0
    
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
            btn.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
        
        if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            currentTurn = Turn.Nought
            turnLabel.text = NOUGHT
            
        }
        
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            currentTurn = Turn.Cross
            turnLabel.text = CROSS
            
        }
        actionCounter = 0

    }
    func addAlert(_ msg: String){
        let alrt = UIAlertController(title: "Game Over", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.resetBoard()
        }
        alrt.addAction(okAction)
        self.present(alrt, animated: true, completion: nil)
    }
    func checkVectory(_ shape: String)->Bool{
        if a1Btn.title(for: .normal) == shape && a2Btn.title(for: .normal) == shape && a3Btn.title(for: .normal) == shape {
            a1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            a2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            a3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }else if b1Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && b3Btn.title(for: .normal) == shape {
            b1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }else if c1Btn.title(for: .normal) == shape && c2Btn.title(for: .normal) == shape && c3Btn.title(for: .normal) == shape {
            c1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }
        
        if a1Btn.title(for: .normal) == shape && b1Btn.title(for: .normal) == shape && c1Btn.title(for: .normal) == shape {
            a1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }else if a2Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && c2Btn.title(for: .normal) == shape {
            a2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }else if a3Btn.title(for: .normal) == shape && b3Btn.title(for: .normal) == shape && c3Btn.title(for: .normal) == shape {
            a3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }
        
        if a1Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && c3Btn.title(for: .normal) == shape {
            a1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }else if a3Btn.title(for: .normal) == shape && b2Btn.title(for: .normal) == shape && c1Btn.title(for: .normal) == shape {
            a3Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            b2Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            c1Btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
            return true
        }
        
        return false
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkVectory(CROSS) {
            addAlert("Cross wins!")
        }
        if checkVectory(NOUGHT) {
            addAlert("Nought wins!")
        }
        if actionCounter == 9 {
            addAlert("Drew!")
        }
    }
    
    func addToBoard(_ sender: UIButton){
        if sender.title(for: .normal) == nil {
            
            if currentTurn == Turn.Cross {
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
                sender.setTitle(CROSS, for: .normal)
                actionCounter += 1
    
            }else if currentTurn == Turn.Nought {
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
                sender.setTitle(NOUGHT, for: .normal)
                actionCounter += 1
            }
            sender.isEnabled = false
        }
    }
    
}

