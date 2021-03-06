//
//  PageCell.swift
//  CoachMarkGuide
//
//  Created by ernie.cheng on 7/2/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            //unwrap the optional page variable so that we can access it in the didSet method
            guard let page = page else {
                return
            }
            
            
            var imageName = page.imageName!

            //add postfix to the landscape coach mark pic (if we have any) and then uncomment down below
//            if UIDevice.current.orientation.isLandscape {
//                imageName += "_landscape"
//            }
            //UIDevice.current.orientation.isLandscape// a good way to tell the difference of landscape or portrait orientation
            
            imageView.image = UIImage(named: imageName)
            
            //this part is not gonna be used inside the coach mark
            //refacoter the font size by declaring a macro ratio based on screen size
            let attributedText = NSMutableAttributedString(string: page.title!,
                                                           attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium),
                                                                        NSForegroundColorAttributeName:UIColor(white: 0.2, alpha: 1)])
            attributedText.append(NSAttributedString(string: "\n\n\(String(describing: page.message))",
                attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14),
                             NSForegroundColorAttributeName:UIColor(white: 0.2, alpha: 1)
                             ]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            
            attributedText.addAttribute(NSParagraphStyleAttributeName,
                                        value: paragraphStyle,
                                        range: NSRange(location: 0, length: attributedText.string.characters.count)
                                        )
            
            textView.attributedText = attributedText
            
//            if let button =  page.button {
//                Button = button
//                print("11111111")
//            }else{
//                print("2222222")
//            }
            
//            Button.isEnabled = page.buttonState.isEnabled
//            Button.isHighlighted = page.buttonState.isHighted
//            
//            if Button.isHighlighted && Button.isEnabled {
//                Button.backgroundColor = UIColor(red: 167/255, green: 32/255, blue: 58/255, alpha: 1)
//                print("1111")
//            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    let imageView = { () -> UIImageView in
        let iv = UIImageView()
        iv.image = UIImage(named: "splash-1")
        
        iv.contentMode = .scaleToFill// .scaleAspectFill //.scaleToFill    //.scaleAspectFit//.scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //this part is not gonna be used inside the cs project coach mark part however, we can learn sth with the
    //NSAttributeString for formatted string
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()

    //this part is not gonna be used inside the cs project coach mark part however, we can learn sth with the
    // a gray line
    let lineSeperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setUpViews() {
        addSubview(imageView)
        //addSubview(textView)
       // addSubview(lineSeperatorView)
        //addSubview(Button)
        
        //for coarch mark
        imageView.anchorAllRound(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        
//        imageView.anchorAllRound(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
//        //layout for the text view
//        textView.anchorAllRound(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
//        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
//        lineSeperatorView.anchorAllRound(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
//        lineSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
//        Button.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 80, heightConstant: 20)
//        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
