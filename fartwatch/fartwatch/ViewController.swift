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

    var fartManager:FartManager!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fartManager = FartManager()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlayFart(sender: AnyObject)
    {
        fartManager.playFart()
    }

}

