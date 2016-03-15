//
//  ViewController.swift
//  ProgressCustom
//
//  Created by Jack Dao on 3/3/16.
//  Copyright © 2016 Rubify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressView = JDProgressView()
    var progressViewMini = JDProgressView()
    var progressViewFat = JDProgressView()
    
    var progressView1 = JDProgressView()
    var progressView2 = JDProgressView()
    
    var progressBatteryView1 = JDProgressView()
    var progressBatteryView2 = JDProgressView()
    var progressBatteryView3 = JDProgressView()
    
    var timer: NSTimer? = nil
    var progressValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
        
        progressView.frame = CGRectMake(10, 120, 50, 70)
        progressView.emptyProgressImagePath = "bottle_empty.png"
        progressView.fullProgressImagePath = "bottle_full.png"
        progressView.ignoreTopPercent = 0.30
        progressView.ignoreBottomPercent = 0.07
        progressView.setProgress(0)
        self.view.addSubview(progressView)
        
        progressViewMini.frame = CGRectMake(10, 200, 30, 50)
        progressViewMini.emptyProgressImagePath = "bottle_empty.png"
        progressViewMini.fullProgressImagePath = "bottle_full.png"
        progressViewMini.ignoreTopPercent = 0.30
        progressViewMini.ignoreBottomPercent = 0.07
        progressViewMini.setProgress(0)
        self.view.addSubview(progressViewMini)
        
        progressViewFat.frame = CGRectMake(60, 140, 90, 50)
        progressViewFat.emptyProgressImagePath = "bottle_empty.png"
        progressViewFat.fullProgressImagePath = "bottle_full.png"
        progressViewFat.ignoreTopPercent = 0.30
        progressViewFat.ignoreBottomPercent = 0.07
        progressViewFat.setProgress(0)
        self.view.addSubview(progressViewFat)
        
        progressView1.frame = CGRectMake(10, 260, 20, 70)
        progressView1.emptyProgressImagePath = "bottle_1.png"
        progressView1.fullColorProgress = UIColor.greenColor()
        progressView1.setProgress(0)
        self.view.addSubview(progressView1)
        
        progressView2.frame = CGRectMake(40, 260, 50, 50)
        progressView2.emptyProgressImagePath = "call_icon.png"
        progressView2.fullColorProgress = UIColor.redColor()
        progressView2.isVerticalProgress = true
        progressView2.setProgress(0)
        self.view.addSubview(progressView2)
        
        progressBatteryView1.frame = CGRectMake(100, 260, 50, 25)
        progressBatteryView1.emptyProgressImagePath = "battery1_empty.png"
        progressBatteryView1.fullProgressImagePath = "battery1_full.png"
        progressBatteryView1.ignoreTopPercent = 0.16
        progressBatteryView1.ignoreBottomPercent = 0.07
        progressBatteryView1.isVerticalProgress = true
        progressBatteryView1.setProgress(0)
        self.view.addSubview(progressBatteryView1)
        
        progressBatteryView2.frame = CGRectMake(160, 260, 50, 15)
        progressBatteryView2.emptyProgressImagePath = "battery2_empty.png"
        progressBatteryView2.fullProgressImagePath = "battery2_full.png"
        progressBatteryView2.ignoreBottomPercent = 0.02
        progressBatteryView2.ignoreTopPercent = 0.25
        progressBatteryView2.isVerticalProgress = true
        progressBatteryView2.setProgress(0)
        self.view.addSubview(progressBatteryView2)
        
        progressBatteryView3.frame = CGRectMake(70, 320, 100, 50)
        progressBatteryView3.emptyProgressImagePath = "battery3_empty.png"
        progressBatteryView3.fullProgressImagePath = "battery3_full.png"
        progressBatteryView3.fullColorProgress = UIColor.orangeColor()
        progressBatteryView3.ignoreBottomPercent = 0.14
        progressBatteryView3.ignoreTopPercent = 0.15
        progressBatteryView3.isVerticalProgress = true
        progressBatteryView3.setProgress(0)
        self.view.addSubview(progressBatteryView3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateProgress() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.progressValue += Int(rand()%10) + 5
            
            self.updatePercentWithProgress(CGFloat(self.progressValue) / 200)
        }
        if progressValue == 200 {
            timer?.invalidate()
            timer = nil
        }
    }
    @IBAction func sliderValueChange(sender: UISlider) {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        let heightUpdate:CGFloat = 180 * CGFloat(sender.value)
        
        self.updatePercentWithProgress(CGFloat(sender.value))
        self.progressValue = Int(heightUpdate)
    }

    @IBAction func progressButtonTouched(sender: AnyObject) {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        UIView.animateWithDuration(0.5) { () -> Void in
            self.progressValue = 0
            self.updatePercentWithProgress(0)
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
    }
    
    func updatePercentWithProgress(value:CGFloat) {
        self.progressView.setProgress(value)
        self.progressViewMini.setProgress(value)
        self.progressViewFat.setProgress(value)
        self.progressView1.setProgress(value)
        self.progressView2.setProgress(value)
        self.progressBatteryView1.setProgress(value)
        self.progressBatteryView2.setProgress(value)
        self.progressBatteryView3.setProgress(value)
    }
}

