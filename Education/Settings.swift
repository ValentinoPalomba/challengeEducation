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
        
     
                        UIApplication.shared.open(URL(string:"App-Prefs:root=General&path=Keyboard")!) 
    }
    
}
