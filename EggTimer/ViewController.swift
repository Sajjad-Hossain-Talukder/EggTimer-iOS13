//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 3.0 , "Medium" : 4.0 , "Hard" : 7.0 ]
    
    var secondsRemaining : Float = 0
    var titleSecondsRemaining : Float = 0
    var total : Float = 0.0
    var passed : Float = 0.0
    var timer = Timer()
    

    @IBOutlet weak var titleAction: UILabel!
    
    @IBOutlet weak var progressTr: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressTr.progress = 0.0
        let button = sender.currentTitle!
        secondsRemaining = Float(eggTimes[button]!)
        passed = 0
        titleAction.text = button
        
        total =  Float(eggTimes[button]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo: nil, repeats: true )
        
    }
    
    
    @objc func updateTimer (){
        
        if self.passed < self.total {
            //if self.secondsRemaining > 0.0 {
            //print ("\(self.secondsRemaining) seconds")
            //self.secondsRemaining -= 1
            self.passed += 1.0
            var percnt = ( self.passed / self.total )
            //print(percnt)
            progressTr.progress = percnt
            
        } else {
            timer.invalidate()
            titleAction.text = "Done!!!"
            titleSecondsRemaining = 20.0
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(titleTimer), userInfo: nil, repeats: true )
        }
    }
    
    @objc func titleTimer (){
        
        if self.titleSecondsRemaining > 0.0 {
            self.titleSecondsRemaining -= 1
        } else {
            timer.invalidate()
            progressTr.progress = 0.0
            titleAction.text = "How do you like your eggs?"
        }
        
    }
    
    
   


    
    
}
