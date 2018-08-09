//
//  CustomView.swift
//  animation
//
//  Created by student on 8/9/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var isFliped = false
    var doubleSidedLayer:CATransformLayer?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.isDoubleSided = true
        self.layer.backgroundColor = UIColor.green.cgColor
        
        doubleSidedLayer = CATransformLayer(layer: self.layer)
        doubleSidedLayer?.position = self.center
        doubleSidedLayer?.frame = self.frame
        doubleSidedLayer?.backgroundColor = UIColor.cyan.cgColor
        
        
        let topLayer = CALayer()
        topLayer.frame = (doubleSidedLayer?.bounds)!
        topLayer.backgroundColor = UIColor.brown.cgColor
        topLayer.zPosition = 2
        topLayer.isDoubleSided = false
//        topLayer.isHidden = false
        
        
        let bottomLayer = CALayer()
        bottomLayer.frame = (doubleSidedLayer?.bounds)!
        bottomLayer.backgroundColor = UIColor.blue.cgColor
        bottomLayer.zPosition = 1
//        bottomLayer.isDoubleSided = false
//        bottomLayer.isHidden = false
        
        doubleSidedLayer?.addSublayer(topLayer)
        doubleSidedLayer?.addSublayer(bottomLayer)
        
        self.layer.addSublayer(doubleSidedLayer!)
        
    }
    
    func flip(){
        CATransaction.begin()
        CATransaction.setAnimationDuration(3.0)
        var perspective = CATransform3DIdentity
        perspective.m34 = 1.0 / -500
        doubleSidedLayer?.transform = perspective
        if !isFliped{
            doubleSidedLayer?.sublayerTransform = CATransform3DMakeRotation(.pi, 0, 1, 0)
        }else{
            doubleSidedLayer?.sublayerTransform = CATransform3DMakeRotation(0, 0, 1, 0)
        }
        CATransaction.commit()
        isFliped = !isFliped
    }
}
