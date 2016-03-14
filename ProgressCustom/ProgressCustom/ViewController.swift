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
    
    var progressView: JDProgressView = JDProgressView()
    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var heightFullBottleContraint: NSLayoutConstraint!
    
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
//        progressView.fullProgressImagePath = "bottle_full.png"
        progressView.fullColorProgress = UIColor.orangeColor()
        progressView.ignoreTop = 0.25
        progressView.ignoreBottom = 0.07
        progressView.setProgress(0)
        
        self.view.addSubview(progressView)
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
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
    }
}

