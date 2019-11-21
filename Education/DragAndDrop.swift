//
//  ViewController.swift
//  TouchAndDRag
//
//  Created by Valentino Palomba on 11/11/2019.
//  Copyright © 2019 Valentino Palomba. All rights reserved.
//

import UIKit

class DragAndDrop1: UIViewController {
    
    @IBOutlet weak var Cerchio: UIImageView!
    @IBOutlet weak var Triangolo: UIImageView!
    @IBOutlet weak var CerchioSotto: UIImageView!
    @IBOutlet weak var TraingoloSotto: UIImageView!
    @IBOutlet weak var Quadrato: UIImageView!
    @IBOutlet weak var Immagine: UIImageView!
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var Back: UIButton!
    override func viewDidLoad() {
        Button.isHidden = true
        Button.isEnabled = false
        Back.isHidden = false
        Back.isEnabled = true
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first
        {
            let position = touch.preciseLocation(in: view)
            if Immagine.frame.contains(position) == true {
                UIView.animate(withDuration: 0.2, animations: {
                    self.Immagine.center = CGPoint(x: position.x, y: position.y)
                    self.TraingoloSotto.isUserInteractionEnabled = false
                    self.CerchioSotto.isUserInteractionEnabled = false
                    
                })
            }
            
            if CerchioSotto.frame.contains(position) == true {
                UIView.animate(withDuration: 0.2, animations: {
                    self.CerchioSotto.center = CGPoint(x: position.x, y: position.y)
                    self.TraingoloSotto.isUserInteractionEnabled = false
                    self.Immagine.isUserInteractionEnabled = false
                })
            }
            if TraingoloSotto.frame.contains(position) == true {
                UIView.animate(withDuration: 0.2, animations: {
                    self.TraingoloSotto.center = CGPoint(x: position.x, y: position.y)
                    self.CerchioSotto.isUserInteractionEnabled = false
                    self.Immagine.isUserInteractionEnabled = false
                })
            }
            confronto(Quadrato: Quadrato, Immagine: Immagine)
            confronto(Quadrato: Triangolo, Immagine: TraingoloSotto)
            confronto(Quadrato: Cerchio, Immagine: CerchioSotto)
            if Immagine.isHighlighted == true && TraingoloSotto.isHighlighted == true && CerchioSotto.isHighlighted == true {
                Button.isHidden = false
                Button.isEnabled = true
                Back.isHidden = false
                Back.isEnabled = true
            }
        }
        
    }
    
    
    func confronto(Quadrato : UIImageView, Immagine : UIImageView)
    {
        if Quadrato.frame.contains(Immagine.frame){
            
            Immagine.frame = Quadrato.frame
            Immagine.center = Quadrato.center
            Immagine.isHighlighted = true
            Immagine.isAccessibilityElement = false
            Immagine.isUserInteractionEnabled = false
            
        }
    }
}
