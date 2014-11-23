//
//  InterfaceController.swift
//  fartwatch WatchKit Extension
//
//  Created by Daniel Haaser on 11/23/14.
//  Copyright (c) 2014 breadsquito. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{
    var fartPlayer:FartPlayer!
    var sharedUserDefaults:NSUserDefaults!
    
    override init(context: AnyObject?)
    {
        // Initialize variables here.
        super.init(context: context)
        
        // Configure interface objects here.
        NSLog("%@ init", self)
        
        fartPlayer = FartPlayer()
        
        sharedUserDefaults = NSUserDefaults(suiteName: "group.danielhaaserwatchhack.shared")
    }

    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

    @IBAction func btnFartPressed()
    {
        NSLog("Fart Button on Watch was ACTIVATED!!!")
        
        fartPlayer.playFart()
        
        NSNotificationCenter.defaultCenter().postNotificationName("fartButtonPressed", object: nil)
        
        sharedUserDefaults.setBool(true, forKey: "playFart")
    }
}
