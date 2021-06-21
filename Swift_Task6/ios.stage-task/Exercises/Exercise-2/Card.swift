import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}
    
    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable, CaseIterable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        let one = (lhs.isTrump == rhs.isTrump)
        let two = (lhs.value.rawValue == rhs.value.rawValue) && (lhs.suit.rawValue == rhs.suit.rawValue)
        
        return one && two
    }
}

extension Card {
    
    func checkIfCanBeat(card: Card) -> Bool {
        if self.isTrump && card.isTrump {
            return self.value.rawValue > card.value.rawValue
        }
        
        if self.isTrump && !card.isTrump {
            return true
        }
        
        if (self.value.rawValue > card.value.rawValue) && (self.suit.rawValue == card.suit.rawValue){
            return true
        }
        
        return false
    }
    
    func checkValue(card: Card) -> Bool {
        return false
    }
}    
