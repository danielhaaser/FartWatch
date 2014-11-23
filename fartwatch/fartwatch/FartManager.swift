//
//  FartManager.swift
//  fartwatch
//
//  Created by Daniel Haaser on 11/23/14.
//  Copyright (c) 2014 breadsquito. All rights reserved.
//

import Foundation
import AudioToolbox

class FartManager : NSObject
{
    
    let totalSounds:UInt32 = 12
    var fartSounds = [SystemSoundID]()
    
    override init()
    {
        for var i:UInt32 = 1; i <= totalSounds; ++i
        {
            let fartSoundPath: String? = NSBundle.mainBundle().pathForResource("fart\(i)", ofType: "wav")
            let fartURL: CFURL! = NSURL.fileURLWithPath(fartSoundPath!)
            var fartSound:SystemSoundID = 0
            AudioServicesCreateSystemSoundID(fartURL, &fartSound)
            fartSounds.append(fartSound)
        }
    }
    
    func playFart ()
    {
        var randIndex:Int = Int(arc4random() % totalSounds)
        AudioServicesPlaySystemSound(fartSounds[randIndex])
    }
}