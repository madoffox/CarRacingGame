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
    @IBOutlet private weak var roadView: UIView!
    
    private let carAppearanceTimeInterval: TimeInterval = 1
    
    var carPosition: Position = .center {
        didSet {
            UIView.animate(withDuration: Constants.defaultAnimationDuration) {
                self.carCenterConstraint.constant = self.carPosition.offset
                self.view.layoutSubviews()
            }
            
        }
    }
    
    var treePosition: Position = .center {
        didSet {
            self.treeCenterConstraint.constant = self.treePosition.offset
            self.treeTopConstraint.constant = 0
            self.view.layoutSubviews()
            
            UIView.animate(withDuration: Constants.defaultAnimationDuration, delay: Constants.defaultAnimationDuration) {
                self.treeTopConstraint.constant = self.roadView.frame.height - self.treeImageView.frame.height
                self.view.layoutSubviews()
            } completion: { _ in
                if self.carPosition == self.treePosition {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Основной экран"
        moveTreeToRandomPlace()
    }
    
    func moveTreeToRandomPlace() {
        Timer.scheduledTimer(
            withTimeInterval: carAppearanceTimeInterval,
            repeats: true
        ) { _ in
            self.treePosition = Position.allCases.randomElement()
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
