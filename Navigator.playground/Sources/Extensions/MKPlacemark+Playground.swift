import MapKit
import Contacts

extension MKPlacemark {
    open override var description: String {
        get {
            return String(format: "<name=%@, isoCountryCode=%@, country=%@, postalCode=%@, administrativeArea=%@, subAdministrativeArea=%@, locality=%@, subLocality=%@, thoroughfare=%@, subThoroughfare=%@, region=%@, timeZone=%@, postalAddress=%@, inlandWather=%@, ocean=%@, areasOfInterest=%@>",
                          self.name ?? "(nil)",
                          self.isoCountryCode ?? "(nil)",
                          self.country ?? "(nil)",
                          self.postalCode ?? "(nil)",
                          self.administrativeArea ?? "(nil)",
                          self.subAdministrativeArea ?? "(nil)",
                          self.locality ?? "(nil)",
                          self.subLocality ?? "(nil)",
                          self.thoroughfare ?? "(nil)",
                          self.subThoroughfare ?? "(nil)",
                          self.region ?? "(nil)",
                          self.timeZone?.description ?? "(nil)",
                          self.postalAddress ?? "(nil)",
                          self.inlandWater ?? "(nil)",
                          self.ocean ?? "(nil)",
                          self.areasOfInterest ?? "(nil)"
            )
        }
    }
}
