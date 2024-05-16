import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate {
    
    var mapView = MKMapView()
    
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        self.mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        self.view.addSubview(mapView)
        setUpLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)// how much we want our map to be zoomed in on our users location
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        let location1: CLLocationCoordinate2D = CLLocationCoordinate2DMake(45.498794, -73.576853)
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = location1
        annotation1.title = "Helper 1"
        annotation1.subtitle = "UNHCR"
        mapView.addAnnotation(annotation1)
        
        let location2: CLLocationCoordinate2D = CLLocationCoordinate2DMake(45.495485, -73.568635)
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Helper 2"
        annotation2.subtitle = "UNHCR"
        mapView.addAnnotation(annotation2)
        
        let location3: CLLocationCoordinate2D = CLLocationCoordinate2DMake(45.505546, -73.570463)
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "Helper 3"
        annotation3.subtitle = "UNHCR"
        mapView.addAnnotation(annotation3)
       
        let location4: CLLocationCoordinate2D = CLLocationCoordinate2DMake(45.507729, -73.562390)
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = location4
        annotation4.title = "Helper 4"
        annotation4.subtitle = "UNHCR"
        mapView.addAnnotation(annotation4)
        
        let location5: CLLocationCoordinate2D = CLLocationCoordinate2DMake(45.502034, -73.581209)
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = location5
        annotation5.title = "Helper 5"
        annotation5.subtitle = "UNHCR"
        mapView.addAnnotation(annotation5)
        
        self.mapView.showsUserLocation = true
        
    }
    
    func setUpLocation(){
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    


}
