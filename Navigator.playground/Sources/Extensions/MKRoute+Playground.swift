import MapKit
import PlaygroundSupport

extension MKRoute {
    override open var description: String {
        get {
            let modifiedSteps = steps[1...steps.count-1]
            let stepsString = (modifiedSteps.map { $0.description }).joined(separator:"\n    ")
                        
            return "Name: \(self.name)\nDistance: \(MKDistanceFormatter().string(fromDistance: self.distance))\nTravel Time: \(self.formattedExpectedTravelTime)\nSteps:\n    \(stepsString)"
        }
    }
    
    public var formattedExpectedTravelTime: String {
        get {
            let time: Int = Int(self.expectedTravelTime)
            let minutes = time / 60 % 60
            let hours   = time / 3600 % 24
            let days    = time / 86400
            
            var timeString = ""
            if (days > 0) {
                timeString.append("\(days)d ")
            }

            if (hours > 0) {
                timeString.append("\(hours)h ")
            }

            if (minutes > 0) {
                timeString.append("\(minutes)m ")
            }
            
            return timeString
        }
    }
}
