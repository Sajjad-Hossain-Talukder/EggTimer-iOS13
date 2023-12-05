//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 3 , "Medium" : 4 , "Hard" : 7 ]
    
    var secondsRemaining : Int = 0
    var titleSecondsRemaining : Int = 0
    var timer = Timer()
    
    @IBOutlet weak var actionButton: UILabel!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let button = sender.currentTitle!
        secondsRemaining = eggTimes[button]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo: nil, repeats: true )
        
        
        
    }
    
    
    @objc func updateTimer (){
        if self.secondsRemaining > 0 {
            print ("\(self.secondsRemaining) seconds")
            self.secondsRemaining -= 1
        } else {
            timer.invalidate()
            actionButton.text = "Done!!!"
            titleSecondsRemaining = 10
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector:#selector(titleTimer), userInfo: nil, repeats: true )
        }
    }
    
    @objc func titleTimer (){
        
        if self.titleSecondsRemaining > 0 {
            self.titleSecondsRemaining -= 1
        } else {
            timer.invalidate()
            actionButton.text = "How do you like your eggs?"
        }
        
    
    }
    
    
   


    
    
}
