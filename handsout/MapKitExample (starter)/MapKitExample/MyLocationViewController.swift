//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    private var setup = false
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        checkAuthorizationStatus()
        mapView.showsUserLocation = true
//        mapView.mapType = .satellite
    }
    
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        // 한번도 처리한적없는경우
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        //        locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        case .restricted, .denied: break
        @unknown default: break
        }
    }
    
    func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedWhenInUse || status == .authorizedAlways else { return }
        guard CLLocationManager.locationServicesEnabled() else { return }
        // 10미터
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        // 10미터 이동할때마다 갱신 (기본값 있음)
        locationManager.distanceFilter = 10.0
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func mornitoringHeading(_ sender: Any) {
        // 기기에서만 사용가능
        guard CLLocationManager.headingAvailable() else { return }
        locationManager.startUpdatingHeading()
    }
    
    @IBAction func stopMornitoring(_ sender: Any) {
    }
}

// MARK: - CLLocationManagerDelegate

extension MyLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("인증됨")
        default:
            print("인증하지 않음")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let current = locations.last!
        let coordinate = current.coordinate
        
        // 작을수록 확대
        // 클수록 축소
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        addAnnotation(location: current)
    }
    
    func addAnnotation(location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.title = "핀"
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("trueHeading :", newHeading.trueHeading) // 진북
        print("magneticHeading", newHeading.magneticHeading) // 자북
        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
    }
}
