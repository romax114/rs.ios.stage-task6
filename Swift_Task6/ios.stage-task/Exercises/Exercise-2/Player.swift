//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if nil == self.hand {
            return false
        }
        
        for cardInHand in self.hand! {
            if card.value == cardInHand.value {
                return true
            }
        }
        
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        if nil == self.hand {
            return false
        }
        
        for (keyCard, valueCard) in table {
            for playerCard in self.hand! {
                if keyCard.value == playerCard.value || valueCard.value == playerCard.value {
                    return true
                }
            }
        }
        
        return false
    }
}
