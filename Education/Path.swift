//
//  Path.swift
//  Education
//
//  Created by Valentino Palomba on 15/11/2019.
//  Copyright © 2019 Marius Minia. All rights reserved.
//

import Foundation
import UIKit



class FollowPath : UIViewController{
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    @IBOutlet weak var Palla: UIImageView!
    
    @IBOutlet weak var Green: UIButton!
    @IBOutlet weak var PopUp: UIImageView!
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var LetteraC: UIImageView!
    @IBOutlet weak var LetteraB: UIImageView!
    @IBOutlet weak var LetteraA: UIImageView!
    
    override func viewDidLoad() {
        Background.isHidden = true
        PopUp.isHidden = true
        Green.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: view)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        tempImageView.image?.draw(in: view.bounds)
        
        // 2
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        
        // 3
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        
        // 4
        context.strokePath()
        
        // 5
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        
        // 6
        swiped = true
        let currentPoint = touch.location(in: view)
        //    drawLine(from: lastPoint, to: currentPoint)
        if self.Palla.frame.contains(touch.location(in: view)){
            drawLine(from: lastPoint, to: currentPoint)
            UIView.animate(withDuration: 0.8, animations: {
                self.Palla.center = CGPoint(x: currentPoint.x, y: currentPoint.y)
            })
            if self.Palla.frame.intersects(LetteraA.frame){
                LetteraA.isHidden = true
            }
            if self.Palla.frame.intersects(LetteraB.frame){
                LetteraB.isHidden = true
            }
            if self.Palla.frame.intersects(LetteraC.frame){
                LetteraC.isHidden = true
            }
            if (LetteraA.isHidden == true && LetteraB.isHidden == true && LetteraC.isHidden == true){
                Background.isHidden = false
                PopUp.isHidden = false
                Green.isHidden = false
            }
        }
        
        // 7
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // disegna punto singolo
            drawLine(from: lastPoint, to: lastPoint)
        }
        
        // UNisce la view Temp alla MAin
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        tempImageView?.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        tempImageView.image = nil
    }
    
    
    @IBAction func resetPressed(_ sender: Any) {
        mainImageView.image = nil
        mainImageView.image = UIImage(named: "sfondomenu_4anni@4x-8")
    }
    
    
    
}
