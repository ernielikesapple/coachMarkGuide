//
//  Page.swift
//  CoachMarkGuide
//
//  Created by ernie.cheng on 7/4/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

import Foundation
import UIKit

//page model for each individual page
struct Page {
    
    //this part is not gonna be used inside the coach mark project 
    let title: String?
    let message: String?
    
    let imageName: String?
    //let button: UIButton?
    let buttonState:ButtonState?
}

struct ButtonState {
    let isHighted : Bool
    let isEnabled : Bool
}
