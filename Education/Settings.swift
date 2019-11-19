//
//  Settings.swift
//  Education
//
//  Created by Valentino Palomba on 14/11/2019.
//  Copyright © 2019 Marius Minia. All rights reserved.
//

import Foundation
import UIKit
class settings : UIViewController {
    
    @IBAction func LinkSettings(_ sender: Any) {
       
        let alertController = UIAlertController (title: "Title", message: "Go to Settings?", preferredStyle: .alert)

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

    
}

