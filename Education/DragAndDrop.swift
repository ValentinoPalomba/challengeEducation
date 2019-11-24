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
   
    @IBOutlet weak var Mano: UIImageView!
    @IBOutlet weak var Fantastic: UIImageView!
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var Back: UIButton!
    override func viewDidLoad() {
       
       
        Button.isHidden = true
        Button.isEnabled = false
        Back.isHidden = false
        Back.isEnabled = true
        Background.isHidden = true
        Fantastic.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let x = Mano.frame.origin.x
            let y = Mano.frame.origin.y
        UIView.animate(withDuration: 3, delay: 0, options: .repeat, animations: {
            self.Mano.transform = CGAffineTransform(translationX: 0, y: -500)
        }, completion: {_ in
            self.Mano.frame = CGRect(x: x, y: x, width: self.Mano.frame.width, height: self.Mano.frame.height)
        })
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first
        {
            self.Mano.isHidden = true
            self.Mano.layer.removeAllAnimations()
            let position = touch.preciseLocation(in: view)
            if Immagine.frame.contains(position) == true && TraingoloSotto.frame.contains(position) == false && CerchioSotto.frame.contains(position) == false{
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.Immagine.center = CGPoint(x: position.x, y: position.y)
                    self.TraingoloSotto.isUserInteractionEnabled = false
                    self.CerchioSotto.isUserInteractionEnabled = false
                    
                })
            }
            
            if CerchioSotto.frame.contains(position) == true && TraingoloSotto.frame.contains(position) == false && Immagine.frame.contains(position) == false{
                UIView.animate(withDuration: 0.2, animations: {
                    self.CerchioSotto.center = CGPoint(x: position.x, y: position.y)
                    self.TraingoloSotto.isUserInteractionEnabled = false
                    self.Immagine.isUserInteractionEnabled = false
                })
            }
            if TraingoloSotto.frame.contains(position) == true && CerchioSotto.frame.contains(position) == false && Immagine.frame.contains(position) == false {
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.TraingoloSotto.center = CGPoint(x: position.x, y: position.y)
                    
                        self.CerchioSotto.stopAnimating()
                })
            }
            confronto(Quadrato: Quadrato, Immagine: Immagine)
            confronto(Quadrato: Triangolo, Immagine: TraingoloSotto)
            confronto(Quadrato: Cerchio, Immagine: CerchioSotto)
            if Immagine.isHighlighted == true && TraingoloSotto.isHighlighted == true && CerchioSotto.isHighlighted == true {
                Button.isHidden = false
                Button.isEnabled = true
                Fantastic.isHidden = false
                Background.isHidden = false
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
