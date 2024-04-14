//
//  Player.swift
//  MovingSpriteTutorial
//
//  Created by Mary Paskhaver on 4/25/23.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    private let movementAmount: CGFloat = 70.0
    private let movementAnimationDuration: TimeInterval = 0.15
    
    func move(
        inDirection direction: UISwipeGestureRecognizer.Direction
    ) {
        switch(direction) {
        case .up:
            moveUp()
            break
        case .down:
            moveDown()
            break
        case .left:
            moveLeft()
            break
        case .right:
            moveRight()
            break
        default:
            return
        }
        
        self.animateMovement(inDirection: direction)
    }
    
    private func moveUp() {
        self.run(SKAction.moveBy(x: 0, y: movementAmount, duration: movementAnimationDuration))
    }
    
    private func moveDown() {
        self.run(SKAction.moveBy(x: 0, y: -movementAmount, duration: movementAnimationDuration))
    }
    
    private func moveLeft() {
        self.run(SKAction.moveBy(x: -movementAmount, y: 0, duration: movementAnimationDuration))
    }
    
    private func moveRight() {
        self.run(SKAction.moveBy(x: movementAmount, y: 0, duration: movementAnimationDuration))
    }
    
    private func animateMovement(inDirection direction: UISwipeGestureRecognizer.Direction) {
        self.run(createAnimationAction(inDirection: direction))
    }
    
    private func createAnimationAction(inDirection direction: UISwipeGestureRecognizer.Direction) -> SKAction {
        
        let directionWord: String = swipeDirectionsToWords[direction.rawValue] ?? "down"
        
        let animation: SKAction = SKAction.animate(with: [
            SKTexture(imageNamed: "\(directionWord)_1"),
            SKTexture(imageNamed: "\(directionWord)_2"),
            SKTexture(imageNamed: "\(directionWord)_0")
        ], timePerFrame: movementAnimationDuration)
        
        return animation
    }
}
