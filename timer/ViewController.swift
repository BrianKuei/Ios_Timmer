//
//  ViewController.swift
//  timer
//
//  Created by student on 2019/3/21.
//  Copyright © 2019年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var timer = Timer()
    var sec : Int = 0
    var isStart : Bool = false
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabelMinute: UILabel!
    
    @IBAction func star(_ sender: UIBarButtonItem) {
        if !isStart{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
            
            timer.fire()
            
            isStart = true
            
        }else{
            timer.invalidate()
            isStart = false
        }
    }
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        timer.invalidate()
        isStart = false
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        sec = 0
        isStart = false
        timer.invalidate()
        timeLabel.text = "0"
        timeLabelMinute.text = "0"
    }
    
    @objc func processTimer(){
        sec += 1
        timeLabelMinute.text = "\(sec / 60)"
        timeLabel.text = "\(sec % 60)"
        
        if sec == 3600{
             sec = 0
        }
    }
}

