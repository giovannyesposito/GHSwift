//
//  GradientBackGround.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 18/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import Foundation
import UIKit

class GradientBackGround: UIViewController {
    
    func backGradient() {
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.darkGray.cgColor, UIColor.gray.cgColor]
        newLayer.frame = view.frame
        view.layer.insertSublayer(newLayer, at: 0)
    
    }
}
