# GKStateMachine

## Exemplo simples
[Modelo inicial de uma Máquina de Estados usando SpriteKit/Swift](https://gist.github.com/murilogteixeira/d51fc1568467f6418b0b0d14f412c44d/edit)

## O que é?
É uma máquina de estados que contém uma coleção de objetos de estados que definem a lógica específica do jogo e as regras para transição de estados.

No GamePlayKit podemos usar o GKState para definir cada estado do seu jogo com as regras específicas de cada estado. Usando uma instância de GKStateMachine podemos gerenciar os estados do jogo. Com isso é possível organizar o código do jogo de forma a controlar quando entramos e saímos em um estado definindo todas as ações e comportamentos de cada estado em específico.

## Formas de uso
Com a máquina de estado podemos controlar vários aspectos do jogo. Como por exemplo:
- Um personagem pode usar a máquina de estados para controlar os estados de Correr, Fugir, Morrer, Reaparecer, no qual podemos definir os comportamentos a serem executados em cada estado.
- Uma torre de disparo pode controlar os estados de Pronto, Carregar, Disparar controlando quando procura alvos próximos e a frequência do disparo.
- Uma interface de usuário do jogo pode usar os estados Menu, Jogar, GameOver, Pause para definir elementos específicos de cada tela e elementos que estão em execução.

## Como construir uma Máquina de Estados
Primeiro criamos uma subclasse de GKState distinta para cada estado possível do jogo. Em cada classe de estado, o método `isValidNextState(_:)` determina para quais estados pode ocorrer a transição a partir da dela. Em seguida crie um objeto de máquina de estado e construa instâncias das classes de estados e passe para o contrutor da máquina de estados. Exemplo:
```swift
let states = [
  MenuState(),
  PlayState(),
  GameOverState()
]

let gameState = GKStateMachine(states: states)
```
Então, coloque a máquina de estados para funcionar entrando no primeiro estado chamando a função `enter(:_)` e passando a classe do estado que deseja entrar:
```swift
gameState(enter: MenuState.self)
```

## Definindo o comportamento de cada estado
Para definir o comportamento específico de cada estado, na classe do estado, sobrescreva os métodos `didEnter(from:)`, `update(deltaTima:)` e `willExit(to:)`.

A máquina de estados notifica cada estado sempre que uma mudança ocorre. Nos métodos `didEnter(from:)` e `willExit(to:)` podemos executar ações em resposta a essas mudanças, como por exemplo, alterar a aparencia de um personagem quando ele está no estado de Fuga sinalizando que está vulnerável ao ataque inimigo.

O método `update(deltaTime:)` funciona para definir ações a serem executadas por quadro, por exemplo alterar a posição do seu personagem.

## Esqueleto de uma máquina de estado
Aqui há dois arquivos como um modelo inicial para guiar na criação da sua máquina de estados que eu costumo utilizar em meus projetos.

O arquivo `GameScene.swift` contém a base para a máquina de estados, é onde iniciamos a nossa máquina definindo o objeto que vai gerenciar nossos estados.

O arquivo `State.swift` é o arquivo base para cada estado, nele contém a implementação dos métodos principais para o funcionamento da máquina de estados e você pode replicar para arquivo inicial de todos os estados.

Existem comentários em todo o código para explicar a funcionalidade de cada linha. Caso necessite, pode criar da forma que desejar utilizando os conceitos apresentados acima. Esses documentos servem para mostrar uma aplicação real da máquina de estados para um jogo utilizando `GKStateMachine`.

Espero ter ajudado você a entender e a criar a sua máquina de estados e utilizar de forma a deixar o seu código e seu jogo mais eficiente.

Fonte: [GKStateMachine - GamePlayKit | Apple Developer Documentation](https://developer.apple.com/documentation/gameplaykit/gkstatemachine)
