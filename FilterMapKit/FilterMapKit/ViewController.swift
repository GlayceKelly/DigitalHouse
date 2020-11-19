//
//  ViewController.swift
//  FilterMapKit
//
//  Created by Glayce Kelly on 18/11/20.
//

import UIKit
import MapKit

enum CategorySelected {
    static let supermarket = 0
    static let gym = 1
    static let college = 2
}

class ViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet private weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var mapView: MKMapView!
    
    //MARK:- Private Properties
    
    private let locationManager: CLLocationManager = CLLocationManager()
    private var customLocations: [CustomLocation] = []
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationAuthorizationStatus()
    }
    
    //MARK:- Actions
    
    @IBAction func selectionCategory(_ sender: UISegmentedControl) {
        mapView.removeAnnotations(customLocations)
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case CategorySelected.supermarket:
            configureSupermarketLocations()
            
        case CategorySelected.college:
            configureCollegeLocations()
            
        case CategorySelected.gym:
            configureGymLocations()
        default:
            print("Categoria inválida")
        }
    }
    
    //MARK:- Private Methods
    
    private func configureSupermarketLocations() {
        let category: String = "Mercado"
        let locationPepe: CLLocation = CLLocation(latitude: -23.531417, longitude: -46.561021)
        let locationHortifruti: CLLocation = CLLocation(latitude: -23.534024, longitude: -46.565818)
        let locationKanguru: CLLocation = CLLocation(latitude: -23.532869, longitude: -46.559634)
        
        customLocations.removeAll()
        customLocations.append(CustomLocation(coordinate: locationPepe.coordinate,
                                              title: "Supermercado Pepe",
                                              subtitle: "",
                                              category: category))
        
        customLocations.append(CustomLocation(coordinate: locationHortifruti.coordinate,
                                              title: "Hortifruti & Supermercado",
                                              subtitle: "",
                                              category: category))
        
        customLocations.append(CustomLocation(coordinate: locationKanguru.coordinate,
                                              title: "Kanguru Supermercado",
                                              subtitle: "",
                                              category: category))
        
        mapView.addAnnotations(customLocations)
        centerOnMap(location: locationPepe)
    }
    
    private func configureCollegeLocations() {
        let category: String = "Faculdade"
        let locationUnip: CLLocation = CLLocation(latitude: -23.528295, longitude: -46.564805)
        let locationUnicid: CLLocation = CLLocation(latitude: -23.536434, longitude: -46.560240)
        
        customLocations.removeAll()
        customLocations.append(CustomLocation(coordinate: locationUnip.coordinate,
                                              title: "UNIP",
                                              subtitle: "",
                                              category: category))
        
        customLocations.append(CustomLocation(coordinate: locationUnicid.coordinate,
                                              title: "UNICID",
                                              subtitle: "",
                                              category: category))
        
        mapView.addAnnotations(customLocations)
        centerOnMap(location: locationUnip)
    }
    
    private func configureGymLocations() {
        let category: String = "Academia"
        let locationSmartFit: CLLocation = CLLocation(latitude: -23.5338757, longitude: -46.565390)
        let locationModelaCenter: CLLocation = CLLocation(latitude: -23.534932, longitude: -46.569563)
        
        customLocations.removeAll()
        customLocations.append(CustomLocation(coordinate: locationSmartFit.coordinate,
                                              title: "SmartFit",
                                              subtitle: "",
                                              category: category))
        
        customLocations.append(CustomLocation(coordinate: locationModelaCenter.coordinate,
                                              title: "Modela Center",
                                              subtitle: "",
                                              category: category))
        
        mapView.addAnnotations(customLocations)
        centerOnMap(location: locationSmartFit)
    }

    private func centerOnMap(location: CLLocation) {
        let region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(region, animated: true)
    }
    
    private func checkLocationAuthorizationStatus() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
}

//MARK:- MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    
}

//MARK:- CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkLocationAuthorizationStatus()
    }
}
