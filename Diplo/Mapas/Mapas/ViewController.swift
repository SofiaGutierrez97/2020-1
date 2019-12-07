//
//  ViewController.swift
//  Mapas
//
//  Created by Sofìa Gutièrrez on 9/14/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
//para obtener localizacion de dipositivo
import CoreLocation
//para mostrar mapas
import MapKit

class ViewController: UIViewController{
    @IBOutlet weak var mapa: MKMapView!
    
    
    var locationManager = CLLocationManager()
    
    var latitud: CLLocationDegrees!
    var longitud: CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //instancia
       // locationManager = CLLocationManager()
        //verificar si estan activados permisos; ir en info plist en privacy
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // cada cuantos metros recibiré actualizaciones, cada cuantos metro me estoy moviendo
        locationManager.distanceFilter = kCLDistanceFilterNone //se actualiza cada que se mueva
        locationManager.allowsBackgroundLocationUpdates = true //para que actualice la app aunque se vaya a segundo plano
        //delegar
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        
    }
    
    
    
    
    @IBAction func getCoords(_ sender: UIButton) {
        print(latitud, longitud)
        
        let localizacion = CLLocationCoordinate2DMake(latitud, longitud)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: localizacion, span: span)
        
        mapa.setRegion(region, animated: true)
        mapa.showsUserLocation = true
        mapa.mapType = .standard
        
    }
    
    
    
    
    


}

extension ViewController: CLLocationManagerDelegate{
    //va guardadando las posiciones que va haciendo el usuario en el arreglo CLLocation par trazar una ruta
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations.first?.altitude)
        print(locations)
            if let location = locations.first{
                self.latitud = location.coordinate.latitude
                self.longitud = location.coordinate.longitude
            }
    
        
        
    }
    
}
    

