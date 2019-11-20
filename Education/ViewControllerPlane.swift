//
//  Scene2.swift
//  Lab2
//
//  Created by Valentino Palomba on 07/11/2019.
//  Copyright © 2019 Valentino Palomba. All rights reserved.
//

import UIKit
import Foundation
import CoreMotion

class ViewController2: UIViewController {
    
    var collision : UICollisionBehavior!
    var animator : UIDynamicAnimator!
    var counter : Int!
    
    @IBOutlet weak var LetteraB: UIImageView!
    @IBOutlet weak var LetteraO: UIImageView!
    @IBOutlet weak var LetterA: UIImageView!
    @IBOutlet weak var LetteraT: UIImageView!
    
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Green: UIButton!
    
    @IBOutlet weak var Barriera: UIImageView!
    @IBOutlet weak var LetteraBSotto: UIImageView!
    @IBOutlet weak var LetteraOSotto: UIImageView!
    
    @IBOutlet weak var BarrieraSotto: UIImageView!
    @IBOutlet weak var LetteraTSotto: UIImageView!
    @IBOutlet weak var LetteraASotto: UIImageView!
    
    var gravity: UIGravityBehavior!
    
    var motionManager = CMMotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUP.isHidden = true
        LetteraASotto.isHidden = true
        LetteraBSotto.isHidden = true
        LetteraOSotto.isHidden = true
        LetteraTSotto.isHidden = true
        Green.isHidden = true
        Green.isEnabled = false
       
        counter = 0
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [Palla])
        gravity.gravityDirection = CGVector(dx: 0, dy: 0)
        animator.addBehavior(gravity)
        
        self.collision = UICollisionBehavior(items: [ self.Palla])
        self.collision.translatesReferenceBoundsIntoBoundary = true
        
        self.collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: Barriera.frame))
        self.collision.addBoundary(withIdentifier: "BarrierDown" as NSCopying, for: UIBezierPath(rect: BarrieraSotto.frame))
        self.animator.addBehavior(self.collision)
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        var bool = false
//        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
//        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!){ (data, error) in
//            if let myData = data {
//                let shake = data?.attitude
//                if shake!.roll > 0.5 && bool == false{
//                    bool = true
//                    /* animazione da fare in entrata */
//
//                }
//                else if shake!.roll > 0.5 && bool == true {
//                    bool = false
//                    /* animazione da fare in uscita */
//                }
//            }
            
//        }
        motionManager.gyroUpdateInterval = 1.0 / 60.0
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                let x = (data?.rotationRate.x ?? 0.0)
                let y = (data?.rotationRate.y ?? 0.0)
                let z = (data?.rotationRate.z ?? 0.0)
                
                self.gravity.gravityDirection = CGVector(dx: y, dy: x)
                
                
            }
            if self.Palla.frame.intersects(self.LetterA.frame) == true {
                self.LetterA.isHidden = true
                self.LetteraASotto.isHidden = false
                
                
            }
            if self.Palla.frame.intersects(self.LetteraB.frame) == true {
                self.LetteraB.isHidden = true
                self.LetteraBSotto.isHidden = false
                
            }
            if self.Palla.frame.intersects(self.LetteraO.frame) == true {
                self.LetteraO.isHidden = true
                self.LetteraOSotto.isHidden = false
                
            }
            if self.Palla.frame.intersects(self.LetteraT.frame) == true {
                self.LetteraT.isHidden = true
                self.LetteraTSotto.isHidden = false
                self.PopUP.isHidden = false
                self.Green.isHidden = false
                self.Green.isEnabled = true
               
            }
            
        }
    }
   
    
    @IBOutlet weak var Palla: UIImageView!
    
    
    
    @IBOutlet weak var PopUP: UIImageView!
    
    
    
    
}





