//
//  File.swift
//  Education
//
//  Created by Valentino Palomba on 14/11/2019.
//  Copyright © 2019 Marius Minia. All rights reserved.
//
import UIKit
class DrawPad: UIViewController {
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    var collision : UICollisionBehavior!
    var animator : UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var path = UIBezierPath()
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    
    
    
    
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
        
        drawLine(from: lastPoint, to: currentPoint)
        
        
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
    }
    
    
    
    @IBAction func pencilPressed(_ sender: UIButton) {
        // 1
        guard let pencil = Pencil(tag: sender.tag) else {
            return
        }
        
        // 2
        color = pencil.color
        
        // 3
        if pencil == .eraser {
            opacity = 1.0
        }
    }
}

