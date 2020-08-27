//
//  ViewController.swift
//  10minuteTask
//
//  Created by jina on 2020/08/04.
//  Copyright © 2020 jina. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var TimeCounter: NSTextField!
    
    
    var timer: Timer?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func startTimer(){
        if let timer = self.timer{
            if !timer.isValid{
                self.timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallBack), userInfo: nil, repeats: true)
            }
        }else{
            self.timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallBack), userInfo: nil, repeats: true)
        }
    }
    @objc func timerCallBack(){
        counter+=1;
        print("\(counter)")
    }
  
    
    


}

