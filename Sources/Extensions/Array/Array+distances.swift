
public extension Array where Element: Strideable {

    /**
     [Common] Element's distance to it's previous element.
  
     - Parameter includeFirst: The first element has no previous element. If **true** *(default)* the first element's distance to itself (zero value) is also included in the result array to match the input array's size.
     - Returns: Each elements distance to it's previous element.
     */
    func distancesRelativeToPrevious(skipFirst: Bool = false) -> [Element.Stride] {
        guard self.count > 1 else {
            return []
        }
        var distances: [Element.Stride] = []
 
        if !skipFirst {
            distances.append(self[0].distance(to: self[0]))
        }

        for i in 1..<self.count {
            distances.append(self[i - 1].distance(to: self[i]))
        }

        return distances
    }

    /**
     [Common] Element's distance to the first element.
     
     - Returns: Each elements distance to the input array's first element.
     */
    func distancesRelativeToFirst(skipFirst: Bool = false) -> [Element.Stride] {
        if skipFirst {
            return self.dropFirst().map {
                first!.distance(to: $0)
            }
        }
        
        return self.map {
            first!.distance(to: $0)
        }
    }
}
