//
//  MusicViewController.swift
//  PlayMusicInApp
//
//  Created by Neha Gupta on 02/08/18.
//  Copyright © 2018 Neha Gupta. All rights reserved.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController {

    //MARK: - IBOutlet's & Variables
    @IBOutlet weak var musicProgressView:UIProgressView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicProgressView.progress = 0.0
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "TriptotheEast", ofType: ".mp3")!))
            audioPlayer.prepareToPlay()
        }catch {
            print(error)
        }
    }
    
    @objc func updateAudioProgressView() {
        if audioPlayer.isPlaying {
            musicProgressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
        }
    }
    
    
    @IBAction func pauseMusic(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }else {
        }
    }
    
    
    @IBAction func playMusic(_ sender: UIButton) {
        if audioPlayer.isPlaying {
        }else {
            audioPlayer.play()
        }
    }
    
    @IBAction func restartMusic(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            musicProgressView.progress = 0.0
            audioPlayer.currentTime = 0
            audioPlayer.prepareToPlay()
        }else {
        }
    }
    
}
