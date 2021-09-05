//
//  Array+Extensions.swift
//  CarRacingGame
//
//  Created by Vladislav on 5.09.21.
//

import Foundation

extension Array {
    func randomElement() -> Element {
        let randomIndex = Int.random(in: 0..<self.count)
        return self[randomIndex]
    }
}
