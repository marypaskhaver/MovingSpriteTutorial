//
//  GameScene.swift
//  MovingSpriteTutorial
//
//  Created by Mary Paskhaver on 4/25/23.
//

import SpriteKit


class GameScene: SKScene {
    var player: Player!
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "player") as! Player
        
        let swipeDirections: [UISwipeGestureRecognizer.Direction] = [.up, .down, .left, .right]
        
        for swipeDirection in swipeDirections {
            let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            swipeGestureRecognizer.direction = swipeDirection
            
            self.view?.addGestureRecognizer(swipeGestureRecognizer)
        }
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        self.player.move(inDirection: sender.direction)
    }

}
