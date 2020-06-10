import MapKit
import PlaygroundSupport

extension MKRoute.Step {
    override open var description: String {
        get {
            var transportTypeString: String
            switch (self.transportType) {
            case .automobile:
                transportTypeString = "Car"
                
            case .walking:
                transportTypeString = "Walk"
                
            case .transit:
                transportTypeString = "Transit"
                
            case .any:
                transportTypeString = "Any"
                
            default:
                transportTypeString = "-"
            }
            
            let distanceFormatter = MKDistanceFormatter()
            return "\(distanceFormatter.string(fromDistance: self.distance)) [\(transportTypeString)]: \(self.instructions)"
        }
    }
}
