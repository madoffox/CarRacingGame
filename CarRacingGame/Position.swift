//
//  Position.swift
//  CarRacingGame
//
//  Created by Vladislav on 4.09.21.
//

import Foundation
import UIKit

enum Position {
    
    
    case left
    case center
    case right
    
    private var widthMultiplier: CGFloat {
        return 0.35
    }
    
    var offset: CGFloat {
        switch self {
        case .left:
            return -UIScreen.main.bounds.width * widthMultiplier
        case .center:
            return 0
        case .right:
            return UIScreen.main.bounds.width * widthMultiplier
        }
    }
}
