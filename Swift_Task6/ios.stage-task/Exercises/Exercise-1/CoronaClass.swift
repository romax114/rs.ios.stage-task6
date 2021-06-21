import Foundation

class CoronaClass {
 
     var seats = [Int]()
     var numberOfDesks = Int()

     init(n: Int) {
        numberOfDesks = n
     }
     
     func seat() -> Int {

        var bestPlace = Int()
        if !seats.contains(0) {
            seats.append(0)
        } else {
        switch seats.count {
          case 0: seats.append(0)
          case 1: seats.append(numberOfDesks-1)
          case 2: bestPlace = Int (seats[0] + seats[1])/2
                  seats.append(bestPlace)
          default:
            var i = 0
            for s in 0..<seats.count-1 {
              while ((seats[s+1]-i) - (seats[s]+i)) >= 0 {
                 bestPlace = (seats[s] + seats[s+1])/2
                 i+=1
              }
            }
            seats.append(bestPlace)
         }
        }
        seats.sort()
        return bestPlace
     }
     
     func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
     }
}    
