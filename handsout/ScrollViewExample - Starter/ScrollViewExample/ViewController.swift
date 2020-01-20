//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by giftbot on 2020. 01. 05..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    private var zoomScale: CGFloat = 1.0
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = true
        updateScrollViewZoomScale()
    }
    
    // MARK: Zoom
    
    private func updateScrollViewZoomScale() {
        let widthScale = view.frame.width / imageView.bounds.width
        let heightScale = view.frame.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = 1
        scrollView.maximumZoomScale = 3
        
    }
    
    // MARK: Action Handler
    
    @IBAction private func fitToWidth(_ sender: Any) {
        print("\n---------- [ fitToWidth ] ----------")
        zoomScale = scrollView.frame.width / imageView.bounds.width
        scrollView.setZoomScale(zoomScale, animated: true)

    }
    
    @IBAction private func scaleDouble(_ sender: Any) {
        print("\n---------- [ scaleDouble ] ----------")
        scrollView.setZoomScale(zoomScale * 2, animated: true)
        zoomScale = scrollView.zoomScale
        print(zoomScale)
        
//        탭탭하면 줌되는거 만들때 사용
//        let rectToVisible = CGRect(x: 400, y: 100, width: 200, height: 200)
//        scrollView.zoom(to: rectToVisible, animated: true)
    }
    
    @IBAction private func moveContentToLeft(_ sender: Any) {
        print("\n---------- [ moveContentToLeft ] ----------")
        let newOffset = CGPoint(x: scrollView.contentOffset.x + 150, y: scrollView.contentOffset.y)
        scrollView.setContentOffset(newOffset, animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}
