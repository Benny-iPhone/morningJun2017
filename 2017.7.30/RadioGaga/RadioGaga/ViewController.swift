//
//  ViewController.swift
//  RadioGaga
//
//  Created by Benny Davidovitz on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!

    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton.isEnabled = false
        
        let urlString = "http://bigrradio.cdnstream1.com/5132_128"
        if let url = URL(string: urlString){
            player = AVPlayer(url: url)
        }
        
        try? AVAudioSession.sharedInstance().setActive(true)
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        switch motion {
        case .remoteControlPause:
            player?.pause()
        case .remoteControlPlay:
            player?.play()
        default:
            break
        }
    }

    @IBAction func playAction(_ sender: UIButton) {
        sender.isEnabled = false
        pauseButton.isEnabled = true
        
        statusLabel.text = "playing 🎶"
        
        player?.play()
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        sender.isEnabled = false
        playButton.isEnabled = true
        
        statusLabel.text = "not playing"
        
        player?.pause()
    }

    @IBAction func volumeAction(_ sender: UISlider) {
        player?.volume = sender.value
    }

}






