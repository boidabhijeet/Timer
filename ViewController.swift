//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var eggtime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var counter: Int = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func decrementCounter() {
        //example functionality
        if counter > 0 {
            DispatchQueue.main.async {
                self.titleLabel.text = "Your Egg Will Be Ready In : \(self.counter)"
            }
            counter -= 1
        } else if counter == 0 {
            timer?.invalidate()
            DispatchQueue.main.async {
                self.titleLabel.text = "Done"
            }
        } else {
            print("Error")
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer?.invalidate()
        let selectedEgg =  sender.currentTitle!
        counter = eggtime[selectedEgg]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
        /*
         let hardness = sender.currentTitle!
         let keys = eggtime.keys
         for key in keys {
         if key == hardness {
         print(eggtime[key]!)
         }
         }
         
         //To add new element in dictionary
         eggtime["SomeKey"] = 10
         
         //To update value in dictionary
         eggtime.updateValue(15, forKey: "SomeKey")
         */
    }
}
