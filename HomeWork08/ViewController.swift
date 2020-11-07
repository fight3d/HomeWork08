//
//  ViewController.swift
//  HomeWork08
//
//  Created by 3droot on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    centerBox()
    
    }

    func centerBox(){
        boxView.center = view.center
    }
    
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if boxView.frame.contains(location ) {
            score += 1
            let half = boxView.frame.width / 2
            let xPos = CGFloat.random(in: half ... view.frame.maxX - half)
            let yPos = CGFloat.random(in: half ... view.frame.maxY - half)
            
            boxView.center = CGPoint(x: xPos, y: yPos)
        } else{
            let alert  = UIAlertController(title: "Game Over", message: "Prees OK to start again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                self.score = 0
                self.centerBox()
                self.scoreLabel.text = "0"
            }))
            self.present(alert, animated: true, completion: nil)
        }
        scoreLabel.text = String(score)
        
        
    }
    

}

