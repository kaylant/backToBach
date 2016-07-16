//
//  ViewController.swift
//  backToBach
//
//  Created by Kaylan Smith on 7/14/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var volume: UISlider!
    @IBOutlet var scrubSlider: UISlider!
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volume.value
    }
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        // this will reset the player object
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("jcbach", ofType: "mp3")!))
            
        } catch {
            
            
            // It didn't work!
        }
    }
    
    func updateScrubSlider() {
    
        scrubSlider.value = Float(player.currentTime)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
        
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("jcbach", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
        
        } catch {
        
        
            // It didn't work!
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateScrubSlider), userInfo: nil, repeats: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

