//
//  ViewController.swift
//  CoachMarkGuide
//
//  Created by ernie.cheng on 7/1/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
}
//encapsulate NSlayoutAnchor apple api
extension UIView{
    func anchorTopLeftBottomRight(top:NSLayoutYAxisAnchor? = nil ,
                                  left: NSLayoutXAxisAnchor? = nil ,
                                  bottom:NSLayoutYAxisAnchor? = nil,
                                  right:NSLayoutXAxisAnchor? = nil){
        
        self.anchorTopLeftBottomRightWithConstant(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
    }
    
    func anchorTopLeftBottomRightWithConstant(top:NSLayoutYAxisAnchor? = nil ,
                                              left: NSLayoutXAxisAnchor? = nil ,
                                              bottom:NSLayoutYAxisAnchor? = nil,
                                              right:NSLayoutXAxisAnchor? = nil,
                                              topConstant:CGFloat = 0,
                                              leftConstant:CGFloat = 0,
                                              bottomConstant:CGFloat = 0,
                                              rightConstant:CGFloat = 0
        ){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}

