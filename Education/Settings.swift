//
//  Settings.swift
//  Education
//
//  Created by Valentino Palomba on 21/11/2019.
//  Copyright © 2019 Marius Minia. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class Settings : UIViewController{
    
    @IBOutlet weak var twoyears: UIButton!
    
    @IBOutlet weak var fouryears: UIButton!
    @IBOutlet weak var threeyears: UIButton!
    @IBOutlet weak var Scritta: UIImageView!
    
    @IBAction func settingsButton(_ sender: Any) {
        
        let alertController = UIAlertController (title: "Activate Guided Access", message: "To prevent your child from exiting the app please, go to Settings -> Accesibilty -> Guided Access", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 3, animations: {
            self.Scritta.transform = CGAffineTransform(translationX: 0, y: 150)
        }, completion: { _ in
             self.Scritta.isHighlighted = true
            self.threeyears.isHidden = false
            self.fouryears.isHidden = false
            self.twoyears.isHidden = false
           
            UIView.animate(withDuration: 2, animations: {
             
                self.twoyears.transform = CGAffineTransform(translationX: 320, y: 0)
                 self.threeyears.transform = CGAffineTransform(translationX: -320, y: 0)
                 self.fouryears.transform = CGAffineTransform(translationX: 320, y: 0)
            }, completion: {
                _ in
               
                first = true
            })
        })
        if first == false{
        playSound()
        }
       
        if first == true{
                   self.Scritta.isHighlighted = false
               }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    
    
    var player: AVAudioPlayer?
       
       func playSound() {
           guard let url = Bundle.main.url(forResource: "Cute_Avalanche", withExtension: "mp3") else { return }
           
           do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
               try AVAudioSession.sharedInstance().setActive(true)
               
               /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
               
               
               guard let player = player else { return }
               
               player.play()
               
           } catch let error {
               print(error.localizedDescription)
           }
       }
}








