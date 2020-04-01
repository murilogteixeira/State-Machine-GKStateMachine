//
//  GameScene.swift
//  StateMachineMacOS
//
//  Created by Murilo Teixeira on 31/03/20.
//

import SpriteKit
import GameplayKit

// MARK: GameScene
class GameScene: SKScene {
    
    // gameState: controla todos os estados do jogo
    lazy var gameState = GKStateMachine(states: self.states)
    
    // states: estados do jogo
    lazy var states = [
        State(gameScene: self)
    ]

    // controlNode: nó de controle (nó pai) que contém os filhos usados em todas as cenas como por exemplo os áudios
    lazy var controlNode: SKNode = {
        let node = SKNode()
        node.position = CGPoint.zero
        node.name = "controlNode"
        node.zPosition = 0
        return node
    }()

    // MARK: didMove
    override func didMove(to view: SKView) {
        // Entra no estado
        gameState.enter(State.self)
                
        // Adiciona o nó controle
        addChild(controlNode)
        
        // Configura o anchorPoint para o centro da cena
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    override func update(_ currentTime: TimeInterval) {
        gameState.currentState?.update(deltaTime: currentTime)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
