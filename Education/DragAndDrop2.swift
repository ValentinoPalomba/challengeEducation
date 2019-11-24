//
//  DragAndDrop2.swift
//  Education
//
//  Created by Valentino Palomba on 13/11/2019.
//  Copyright © 2019 Marius Minia. All rights reserved.
//

import UIKit


class DragAndDrop2 : UIViewController{
    @IBOutlet weak var Cerchio: UIImageView!
    @IBOutlet weak var Triangolo: UIImageView!
    @IBOutlet weak var CerchioSotto: UIImageView!
    @IBOutlet weak var TraingoloSotto: UIImageView!
    @IBOutlet weak var Quadrato: UIImageView!
    @IBOutlet weak var Immagine: UIImageView!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var Well: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button.isHidden = true
        Button.isEnabled = false
        Back.isEnabled = true
        Back.isHidden = false
        Background.isHidden = true
        Well.isHidden = true
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first
        {
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
            if (Quadrato.frame.contains(CerchioSotto.frame) || Quadrato.frame.contains(TraingoloSotto.frame)){
                           let generator = UINotificationFeedbackGenerator()
                           generator.notificationOccurred(.error)

                           }
                       if (Cerchio.frame.contains(Immagine.frame) || Cerchio.frame.contains(TraingoloSotto.frame)){
                       let generator = UINotificationFeedbackGenerator()
                       generator.notificationOccurred(.error)

                       }
                       if (Triangolo.frame.contains(CerchioSotto.frame) || Triangolo.frame.contains(Immagine.frame)){
                       let generator = UINotificationFeedbackGenerator()
                       generator.notificationOccurred(.error)

                       }
            
            
            confronto(Quadrato: Quadrato, Immagine: Immagine)
            confronto(Quadrato: Triangolo, Immagine: TraingoloSotto)
            confronto(Quadrato: Cerchio, Immagine: CerchioSotto)
            if Immagine.isHighlighted == true && TraingoloSotto.isHighlighted == true && CerchioSotto.isHighlighted == true {
                Button.isHidden = false
                Button.isEnabled = true
                Background.isHidden = false
                Well.isHidden = false
            }
        }
        
    }
    
    
    func confronto(Quadrato : UIImageView, Immagine : UIImageView){
        if Quadrato.frame.contains(Immagine.frame){
          
            Immagine.frame = Quadrato.frame
            Immagine.center = Quadrato.center
            Immagine.isHighlighted = true
            Immagine.isAccessibilityElement = false
            
        }
    }
}



