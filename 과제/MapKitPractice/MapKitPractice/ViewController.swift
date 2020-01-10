//
//  ViewController.swift
//  MapKitPractice
//
//  Created by Hongdonghyun on 2020/01/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    private let myHomeCoordinate = CLLocationCoordinate2DMake(37.566308, 126.977948)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMyhome(coordinate: myHomeCoordinate)
    }

    private func setMyhome(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        addAnnotation(coordinate: coordinate)
        addOverlay(coordinate: coordinate)
        
    }
}

extension ViewController {
    private func addAnnotation(coordinate: CLLocationCoordinate2D) {
        let myHome = MKPointAnnotation()
        myHome.title = "우리집"
        myHome.subtitle = "사실 우리집 아님"
        myHome.coordinate = coordinate
        mapView.addAnnotation(myHome)
        
    }
    
    private func addOverlay(coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        var point1 = center; point1.latitude += 0.01; point1.longitude += 0.01
        var point2 = center; point2.latitude += 0.01; point2.longitude -= 0.01
        var point3 = center; point3.latitude -= 0.01;
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.green
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
