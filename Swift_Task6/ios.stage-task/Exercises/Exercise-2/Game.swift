//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
        var players: [Player] { get set }
}

struct Game: GameCompatible {
        var players: [Player]
}

extension Game {

        func defineFirstAttackingPlayer(players: [Player]) -> Player? {
                guard !players.isEmpty else { return nil }
                var firstAttacker = players.first!
                
                for player in players.dropFirst() {
                        let firstAttackersContender  = leastTrumpContender(for: firstAttacker)
                        let playersContender         = leastTrumpContender(for: player)
                        
                        if (!firstAttackersContender.isTrump && playersContender.isTrump) || (firstAttackersContender.isTrump == playersContender.isTrump && playersContender.value.rawValue < firstAttackersContender.value.rawValue) {
                                firstAttacker = player
                        }
                }
                
                return firstAttacker
        }
        
        func leastTrumpContender(for player: Player) -> Card {
                var leastTrump: Card? = nil
                for card in player.hand! {
                        guard card.isTrump else { continue }

                        if leastTrump == nil {
                                leastTrump = card
                        } else {
                                if card.value.rawValue < leastTrump!.value.rawValue {
                                        leastTrump = card
                                }
                        }
                }
                
                if leastTrump == nil {
                        leastTrump = player.hand?.sorted(by: { $0.value.rawValue < $1.value.rawValue }).first!
                }
                
                return leastTrump!
        }
}
