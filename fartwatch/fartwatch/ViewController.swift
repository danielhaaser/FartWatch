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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fartManager = FartManager()
        
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
        fartManager.playFart()
    }

}

