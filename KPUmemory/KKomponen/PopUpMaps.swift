//
//  PopUpMaps.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//

import UIKit
import MapKit
import CoreLocation

protocol PopUpMapsDelegate {
    func actConfirm(loc: String)
    func actBack()
}

class PopUpMaps: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
  @IBOutlet weak var navigation: NavigationBar!
  @IBOutlet weak var lblCurrentLocation: UILabel!
  @IBOutlet weak var mapKit: MKMapView!
  @IBOutlet weak var btnSelectLocation: UIButton!
    
    var delegate: PopUpMapsDelegate?
    var locationManager = CLLocationManager()
    var navigationTitle = "Select Location"
    var locTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
    }
  // Mengatur tampilan elemen-elemen antarmuka pengguna
    func setUpView(){
        self.navigationController?.isNavigationBarHidden = true
        navigation.setTitle(navigationTitle)
        navigation.delegate = self
        lblCurrentLocation.text = locTitle
        btnSelectLocation.setTitle("Select Location", for: .normal)
    }
    
    func setUpAction(){
        mapKit.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        btnSelectLocation.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            // Start updating user's location
            mapKit.showsUserLocation = true
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            centerMapOnLocation(location: location)
            addPinpointToMap(coordinate: location.coordinate)
            getAddressFromLocation(location: location)
        }
    }

    // MARK: - Map Methods

    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000 // Adjust as needed
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapKit.setRegion(coordinateRegion, animated: true)
    }

    func addPinpointToMap(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapKit.addAnnotation(annotation)
    }

    // MARK: - Reverse Geocoding

    func getAddressFromLocation(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let placemark = placemarks?.first {
                if let address = placemark.name,
                    let city = placemark.locality,
                    let state = placemark.administrativeArea,
                    let country = placemark.country {
                    print("Address: \(address), City: \(city), State: \(state), Country: \(country)")
                    self.locTitle = ("\(address), \(city), \(state), \(country)")
                    self.lblCurrentLocation.text = self.locTitle
                }
            }
        }
    }
    
    @objc func selectLocation(){
        self.delegate?.actConfirm(loc: locTitle)
    }
    
    
    

}

extension PopUpMaps: NavigationBarDelegate{
    func pressBack() {
        self.delegate?.actBack()
    }
}
