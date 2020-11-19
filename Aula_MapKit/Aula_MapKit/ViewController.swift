//
//  ViewController.swift
//  Aula_MapKit
//
//  Created by Glayce Kelly on 17/11/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let aracaju = MKPointAnnotation()
//        aracaju.title = "Aracaju"
//        aracaju.coordinate = CLLocationCoordinate2D(latitude: -10.946477, longitude: -37.072436)
//        //Adiciona a anotação na coordenada passada no coordinate (CLLocationCoordinate2D)
//        mapView.addAnnotation(aracaju)
        
        mapView.delegate = self
        
        let location = CLLocation(latitude: -10.946477, longitude: -37.072436)
        let customLocation = CustomLocation(coordinate: location.coordinate,
                                            title: "Titulo",
                                            subtitle: "Subtitulo",
                                            category: "Categoria")
        mapView.addAnnotation(customLocation)
        //PARA ADICIONAR OU REMOVER AS LOCATIONS
//        mapView.addAnnotations(arrayDeAnnotations)
//        mapView.removeAnnotations(arrayDeAnnotations)
        centerMapOn(location: location)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationAuthorizationStatus()
    }
    
    func checkLocationAuthorizationStatus() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func centerMapOn(location: CLLocation) {
        //Centraliza o mapa passando o coordinate (CLLocationCoordinate2D) e a latitude e longitude
        let region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is CustomLocation else { return nil }
        
        let indentifier: String = "marker"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: indentifier)
        
        if annotationView == nil {
            //Adiciona o titulo, subtitulo e o botão de informação
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: indentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Clique no ícone de informação")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Selecionado")
        
        if let annotation = view.annotation as? CustomLocation {
            print(annotation.category ?? "")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkLocationAuthorizationStatus()
    }
}

