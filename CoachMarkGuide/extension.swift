//
//  extension.swift
//  CoachMarkGuide
//
//  Created by ernie.cheng on 7/4/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

import UIKit

//encapsulate NSlayoutAnchor apple api
extension UIView{
    func anchorAllRound(top:NSLayoutYAxisAnchor? = nil ,
                        left: NSLayoutXAxisAnchor? = nil ,
                        bottom:NSLayoutYAxisAnchor? = nil,
                        right:NSLayoutXAxisAnchor? = nil){
        
        self.anchorAllRoundWithConstant(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
    }
    
    func anchorAllRoundWithConstant(top:NSLayoutYAxisAnchor? = nil ,
                                    left: NSLayoutXAxisAnchor? = nil ,
                                    bottom:NSLayoutYAxisAnchor? = nil,
                                    right:NSLayoutXAxisAnchor? = nil,
                                    topConstant:CGFloat = 0,
                                    leftConstant:CGFloat = 0,
                                    bottomConstant:CGFloat = 0,
                                    rightConstant:CGFloat = 0
        ){
        
        _ = anchor(top: top,
                   left: left,
                   bottom: bottom,
                   right: right,
                   topConstant: topConstant,
                   leftConstant: leftConstant,
                   bottomConstant: bottomConstant,
                   rightConstant: rightConstant)
        
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left:NSLayoutXAxisAnchor? = nil,
                bottom:NSLayoutYAxisAnchor? = nil,
                right:NSLayoutXAxisAnchor? = nil,
                topConstant:CGFloat = 0,
                leftConstant:CGFloat = 0,
                bottomConstant:CGFloat = 0,
                rightConstant:CGFloat = 0,
                widthConstant:CGFloat = 0,
                heightConstant:CGFloat = 0) -> [NSLayoutConstraint] {
        
            translatesAutoresizingMaskIntoConstraints = false
            var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        if let bottom = bottom {
           anchors.append(self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        if let right = right {
           anchors.append(self.rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        if widthConstant > 0 {
           anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        if heightConstant > 0 {
           anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }

        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    
    
}
