//
//  SearchViewController.swift
//  MapKitPractice
//
//  Created by Hongdonghyun on 2020/01/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    private var lastSearchText = ""
    private var lastCoordinate = CLLocationCoordinate2D()
    private var lastSequence = 1
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didEnd(_ sender: Any) {
         geocodeAddressString(searchTextField.text ?? "")
    }
    @IBAction func searchBtnAction(_ sender: UIButton) {
        geocodeAddressString(searchTextField.text ?? "")
        
    }
    
    private func setLocation(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension SearchViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBtnAction(searchBtn)
        return true
    }
}

extension SearchViewController {
    private func geocodeAddressString(_ address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard address != self.lastSearchText, let coordinate = placeMark?.first?.location?.coordinate else { return }
            self.setLocation(coordinate: coordinate)
            self.addAnnotation(coordinate: coordinate, address: address, sequence: self.lastSequence)
            self.addRectOverlay(coordinate)
            self.addLineOverlay(source: self.lastCoordinate, destination: coordinate)
            self.lastSequence += 1
            self.lastSearchText = address
            self.lastCoordinate = coordinate
        }
    }
}

extension SearchViewController {
    private func addAnnotation(coordinate: CLLocationCoordinate2D, address: String, sequence: Int) {
        let pinPlace = MKPointAnnotation()
        pinPlace.title = "\(lastSequence)번째 행선지"
        pinPlace.subtitle = address
        pinPlace.coordinate = coordinate
        mapView.addAnnotation(pinPlace)
    }
    
    private func addLineOverlay(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        guard !source.latitude.isZero || !source.longitude.isZero else { return }
        let points: [CLLocationCoordinate2D] = [source, destination]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
        
    }
    
    private func addRectOverlay(_ coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        var point1 = center; point1.latitude += 0.001; point1.longitude += 0.001
        var point2 = center; point2.latitude -= 0.001; point2.longitude += 0.001
        var point3 = center; point3.latitude -= 0.001; point3.longitude -= 0.001
        var point4 = center; point4.latitude += 0.001; point4.longitude -= 0.001
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
    }
    
}

extension SearchViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
