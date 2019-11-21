//
//  Settings.swift
//  Education
//
//  Created by Valentino Palomba on 21/11/2019.
//  Copyright © 2019 Marius Minia. All rights reserved.
//

import Foundation
import UIKit

class Settings : UIViewController{
    
    
    
    @IBAction func settingsButton(_ sender: Any) {
        
        let alertController = UIAlertController (title: "Activate Guided Access", message: "To prevent your child from exiting the app please, go to Settings -> General -> Accesibilty -> Guided Access", preferredStyle: .alert)
        
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
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if first == false   {
            let alertController1 = UIAlertController (title: "Activate Guided Access", message: "To prevent your child from exiting the app please, go to Settings -> General -> Accesibilty -> Guided Access", preferredStyle: .alert)
            
            let settingsAction1 = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                
                guard let settingsUrl1 = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                if UIApplication.shared.canOpenURL(settingsUrl1) {
                    UIApplication.shared.open(settingsUrl1, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                }
            }
            alertController1.addAction(settingsAction1)
            let cancelAction1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController1.addAction(cancelAction1)
            
            present(alertController1, animated: true, completion: nil)
            first = true
        }
    }
}








