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

    let pickerArray : [RadioStation]
    var currentStation : RadioStation?{
        didSet{
            if let url = currentStation?.url{
                player = AVPlayer(url: url)
                
                playButton.isEnabled = true
                pauseButton.isEnabled = false
            }
        }
    }
    var player : AVPlayer?
    
    required init?(coder aDecoder: NSCoder) {
        pickerArray = RadioStation.readFile()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton.isEnabled = false

        self.currentStation = pickerArray.first
        
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

extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentStation = pickerArray[row]
    }
}





























