//
//  ViewController.swift
//  10minuteTask
//
//  Created by jina on 2020/08/04.
//  Copyright © 2020 jina. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var Subject: NSTextField!
    @IBOutlet weak var TimeCounter: NSTextField!
    @IBOutlet weak var startButton: NSButtonCell!
    
    @IBAction func startButton(_ sender: Any) {
        let isStart = startButton.state.rawValue
        
        if isStart == 0 {
            print("카운터 종료")
            startButton.title = "stop"
            stopTimer()
        } else{
            print("카운터 시작")
            startButton.title = "start"
            startTimer()
        }
        
    }
    
    
    var timer: Timer?
    var counter = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
    
    func stopTimer(){
        if let timer = self.timer{
            if timer.isValid{
                timer.invalidate()
            }
        }
    }
    
    @objc func timerCallBack(){
        counter+=1
        TimeCounter.stringValue = "\(counter)"
        print("\(counter)")
    }
  
    
    


}

