//
//  GameViewController.swift
//  StateMachineIOS
//
//  Created by Murilo Teixeira on 31/03/20.
//

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
            let scene = GameScene(size: view.frame.size)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

