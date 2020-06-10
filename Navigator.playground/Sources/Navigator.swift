import MapKit
import CoreLocation
import PlaygroundSupport

public class Navigator {
    
    public static func runTest(_ origin: String, _ destination: String) {

        calculateRoute(origin: origin, destination: destination) { (routes: [MKRoute]?, error: Error?) in
            if routes != nil {
                let routesString = (routes!.map { $0.description }).joined(separator: "\n --- \n")
                print (routesString)
            } else if error != nil {
            }
        }
    }
    
    public static func calculateRoute(origin: String, destination: String, completionHandler:@escaping (_ response:[MKRoute]?, _ error:Error?) -> ()) {
        
        let originSearchRequest = MKLocalSearch.Request()
        originSearchRequest.naturalLanguageQuery = origin
        let originSearch = MKLocalSearch(request: originSearchRequest)
        
        let destinationSearchRequest = MKLocalSearch.Request()
        destinationSearchRequest.naturalLanguageQuery = destination
        let destinationSearch = MKLocalSearch(request: destinationSearchRequest)
        
        // Search for an origin
        originSearch.start { (response: MKLocalSearch.Response?, error: Error?) in
            completionHandler(nil, error)
            
            if response != nil {
                
                let originMapItem = response!.mapItems.first
                
                // Search for a destination
                destinationSearch.start { (response: MKLocalSearch.Response?, error: Error?) in
                    completionHandler(nil, error)
                    
                    if response != nil {
                        
                        let destinationMapItem = response!.mapItems.first
                        
                        let directionsSearchRequest = MKDirections.Request()
                        directionsSearchRequest.source = originMapItem
                        directionsSearchRequest.destination = destinationMapItem
                        directionsSearchRequest.transportType = .automobile
                        directionsSearchRequest.requestsAlternateRoutes = true
                        
                        let directions = MKDirections(request: directionsSearchRequest)
                        
                        // Calculate route
                        directions.calculate { (response: MKDirections.Response?, error: Error?) in
                            if response != nil {
                                completionHandler(response!.routes, error)
                            }
                        }
                    }
                }
            }
        }
    }
}
