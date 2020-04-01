//
//  State.swift
//  StateMachineMacOS
//
//  Created by Murilo Teixeira on 31/03/20.
//

import Cocoa
import SpriteKit
import GameplayKit

// MARK: State
class State: GKState {
    // gameScene do jogo
    unowned let gameScene: GameScene
    // nó de controle da gameScene
    var controlNode: SKNode!
    // cena desse estado
    var scene: SKSpriteNode!
    
    // Valida para qual estado esse pode ir
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is State.Type:
            return true
        default:
            return false
        }
    }
    
    // Entrou nesse estado
    override func didEnter(from previousState: GKState?) {
        print("Did enter state\(self)")
        // Inicializa a referencia para o controlNode da gameScene
        controlNode = gameScene.controlNode
        
        // Inicializa a cena desse estado
        scene = buildScene()
        
        // Adiciona a cena desse estado no nó de controle
        controlNode?.addChild(scene)
        
        // Adicionar todos os nós que compõem essa cena
    }
    
    // Vai sair desse estado
    override func willExit(to nextState: GKState) {
        self.scene.removeAllChildren()
        self.scene.removeFromParent()
        self.controlNode = nil
        self.scene = nil
    }
    
    override func update(deltaTime seconds: TimeInterval) {

    }
    
    // Construir cena
    func buildScene() -> SKSpriteNode {
        let node = SKSpriteNode()
        node.color = .blue
        node.size = gameScene.size
        node.zPosition = 1
        node.name = "sceneName"
        return node
    }
    
    // MARK: init
    init(gameScene: GameScene) {
        self.gameScene = gameScene
        super.init()
    }
}
