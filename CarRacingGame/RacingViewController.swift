//
//  RacingViewController.swift
//  CarRacingGame
//
//  Created by Vladislav on 4.09.21.
//

import UIKit

class RacingViewController: UIViewController {
    @IBOutlet private weak var carImageView: UIImageView!
    @IBOutlet private weak var treeImageView: UIImageView!
    @IBOutlet private weak var carCenterConstraint: NSLayoutConstraint!
    @IBOutlet private weak var treeCenterConstraint: NSLayoutConstraint!
    @IBOutlet private weak var treeTopConstraint: NSLayoutConstraint!
    
    var carPosition: Position = .center {
        didSet {
            UIView.animate(withDuration: Constants.defaultAnimationDuration) {
                self.carCenterConstraint.constant = self.carPosition.offset
                self.view.layoutSubviews()
            }
            
        }
    }
    
    @IBAction private func leftButtonPressed() {
        switch carPosition {
        case .right:
            carPosition = .center
        case .center:
            carPosition = .left
        case .left:
            break
        }
    }
    
    @IBAction private func rightButtonPressed() {
        switch carPosition {
        case .left:
            carPosition = .center
        case .center:
            carPosition = .right
        case .right:
            break
        }
    }
}
