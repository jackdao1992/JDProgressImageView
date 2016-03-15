//
//  ViewController.swift
//  ProgressCustom
//
//  Created by Jack Dao on 3/3/16.
//  Copyright © 2016 Rubify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emptyTypeImageView: UIImageView!
    @IBOutlet weak var fullTypeImageView: UIImageView!
    
    @IBOutlet weak var heightFullBottleContraint: NSLayoutConstraint!
    
    var progressView: JDProgressView = JDProgressView()
    
    var progressView1 = JDProgressView()
    var progressView2 = JDProgressView()
    
    var progressBatteryView1 = JDProgressView()
    var progressBatteryView2 = JDProgressView()
    var progressBatteryView3 = JDProgressView()
    
    var timer: NSTimer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animateWithDuration(0.5) { () -> Void in
            self.heightFullBottleContraint.constant = 0
            self.fullTypeImageView.setNeedsDisplay()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
        
        progressView.frame = CGRectMake(100, 300, 100, 150)
        progressView.emptyProgressImagePath = "bottle_empty.png"
        progressView.fullProgressImagePath = "bottle_full.png"
        progressView.ignoreTop = 0.25
        progressView.ignoreBottom = 0.07
        progressView.setProgress(0)
        self.view.addSubview(progressView)
        
        progressView1.frame = CGRectMake(200, 300, 45, 150)
        progressView1.emptyProgressImagePath = "bottle_1.png"
        progressView1.fullColorProgress = UIColor.greenColor()
        progressView1.setProgress(0)
        self.view.addSubview(progressView1)
        
        progressView2.frame = CGRectMake(300, 300, 150, 150)
        progressView2.emptyProgressImagePath = "call_icon.png"
        progressView2.fullColorProgress = UIColor.redColor()
        progressView2.isVerticalProgress = true
        progressView2.setProgress(0)
        self.view.addSubview(progressView2)
        
        progressBatteryView1.frame = CGRectMake(100, 460, 100, 50)
        progressBatteryView1.emptyProgressImagePath = "battery1_empty.png"
        progressBatteryView1.fullProgressImagePath = "battery1_full.png"
        progressBatteryView1.isVerticalProgress = true
        progressBatteryView1.setProgress(0)
        self.view.addSubview(progressBatteryView1)
        
        progressBatteryView2.frame = CGRectMake(250, 470, 100, 30)
        progressBatteryView2.emptyProgressImagePath = "battery2_empty.png"
        progressBatteryView2.fullProgressImagePath = "battery2_full.png"
        progressBatteryView2.isVerticalProgress = true
        progressBatteryView2.setProgress(0)
        self.view.addSubview(progressBatteryView2)
        
        progressBatteryView3.frame = CGRectMake(400, 460, 100, 50)
        progressBatteryView3.emptyProgressImagePath = "battery3_empty.png"
        progressBatteryView3.fullProgressImagePath = "battery3_full.png"
        progressBatteryView3.fullColorProgress = UIColor.orangeColor()
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
            self.heightFullBottleContraint.constant = self.heightFullBottleContraint.constant + CGFloat(random() % 20) + 4
            self.fullTypeImageView.layoutIfNeeded()
            self.fullTypeImageView.setNeedsDisplay()
            
            self.progressView.setProgress(self.heightFullBottleContraint.constant / 180)
            self.progressView1.setProgress(self.heightFullBottleContraint.constant / 180)
            self.progressView2.setProgress(self.heightFullBottleContraint.constant / 180)
            self.progressBatteryView1.setProgress(self.heightFullBottleContraint.constant / 180)
            self.progressBatteryView2.setProgress(self.heightFullBottleContraint.constant / 180)
            self.progressBatteryView3.setProgress(self.heightFullBottleContraint.constant / 180)
        }
        if heightFullBottleContraint.constant == 200 {
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
        
        self.progressView.setProgress(CGFloat(sender.value))
        self.progressView1.setProgress(CGFloat(sender.value))
        self.progressView2.setProgress(CGFloat(sender.value))
        self.progressBatteryView1.setProgress(CGFloat(sender.value))
        self.progressBatteryView2.setProgress(CGFloat(sender.value))
        self.progressBatteryView3.setProgress(CGFloat(sender.value))
        //            UIView.animateWithDuration(0) { () -> Void in
        self.heightFullBottleContraint.constant = heightUpdate
//        self.fullTypeImageView.layoutIfNeeded()
        self.fullTypeImageView.setNeedsDisplay()
        //            }
    }

    @IBAction func progressButtonTouched(sender: AnyObject) {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        UIView.animateWithDuration(0.5) { () -> Void in
            self.heightFullBottleContraint.constant = 16
            self.fullTypeImageView.setNeedsDisplay()
            self.progressView.setProgress(0)
            self.progressView1.setProgress(0)
            self.progressView2.setProgress(0)
            self.progressBatteryView1.setProgress(0)
            self.progressBatteryView2.setProgress(0)
            self.progressBatteryView3.setProgress(0)
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
    }
}

