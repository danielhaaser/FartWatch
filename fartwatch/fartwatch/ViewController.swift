//
//  ViewController.swift
//  fartwatch
//
//  Created by Daniel Haaser on 11/23/14.
//  Copyright (c) 2014 breadsquito. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var lblTestLabel: UILabel!
    var fartManager:FartManager!
    var sharedUserDefaults:NSUserDefaults!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fartManager = FartManager()
        
        sharedUserDefaults = NSUserDefaults(suiteName: "group.danielhaaserwatchhack.shared")

        let timer = NSTimer(timeInterval: 0.1, target: self, selector: "timerFired", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        timer.fire()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "fartObserved", name: "fartButtonPressed", object: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fartObserved()
    {
        NSLog("fart button OBSERVED SWEET JESUS it's WORKING!!!!")
        lblTestLabel.text = "WHOAH IT WORKED"
    }

    @IBAction func btnPlayFart(sender: AnyObject)
    {
        NSLog("playFart on device pressed")
        fartManager.playFart()
    }
    
    func timerFired()
    {
        NSLog("timer fired")
        
        var shouldPlay = sharedUserDefaults.boolForKey("playFart")
        if (shouldPlay)
        {
            sharedUserDefaults.setBool(false, forKey: "playFart")
            fartManager.playFart()
            lblTestLabel.text = "Fart ACTIVATE!"
        }
        else
        {
            lblTestLabel.text = "Huh?"
        }
        

    }

}

