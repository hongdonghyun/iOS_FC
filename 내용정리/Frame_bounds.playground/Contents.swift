//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 667)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        topView()
        bottomView()
        
//        viewFrameSizeView(superView: self.view)
        
//        let blueview = blueView()
//        let redView = innerRedView(superView: blueview)
//        let greenview = innergreenView(superView: redView)
        
//        let greenView = setUpSuperview()
//        let redView = setUpSubview(superView: greenView)
//
//        greenView.frame.origin = CGPoint(x: 100, y: 100)
//        greenView.bounds.origin = CGPoint(x: 100, y: 100)
    }
    
    func blueView() -> UIView {
        let blueView = UIView()
        blueView.frame = CGRect(x: 30, y: 30, width: 315, height: 607)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        return blueView
    }
    
    func topView() -> UIView {
        let topView = UIView()
        topView.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
        topView.backgroundColor = .blue
        view.addSubview(topView)
        return topView
    }
    
    func bottomView() -> UIView {
        let bottomView = UIView()
        bottomView.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
        bottomView.backgroundColor = .red
        view.addSubview(bottomView)
        return bottomView
    }
    
    func viewFrameSizeView(superView: UIView) -> UIView {
        let frameSizeView = UIView()
        frameSizeView.frame = CGRect(x: 15, y: 15, width: superView.frame.size.width - 30, height: 100)
        frameSizeView.backgroundColor = .green
        superView.addSubview(frameSizeView)
        return frameSizeView
    }
    
    func innerRedView(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame.size = CGSize(width: 255, height: 537)
        redView.frame.origin = CGPoint(x: 30,y: 30)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
    
    func innergreenView(superView: UIView) -> UIView {
        let greenView = UIView()
        greenView.frame.size = CGSize(width: 195, height: 477)
        greenView.frame.origin = CGPoint(x: 30,y: 30)
        greenView.backgroundColor = .green
        superView.addSubview(greenView)
        return greenView
    }
    
//    func setUpSuperview() -> UIView {
//        let greenView = UIView()
//        greenView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
//        greenView.backgroundColor = .green
//        view.addSubview(greenView)
//        return greenView
//    }
    
//    func setUpSubview(superView: UIView) -> UIView {
//        let redView = UIView()
//        // addsubview(superview)를 기준으로 이동
//        redView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        redView.backgroundColor = .red
//        // superview에 addsubview
//        superView.addSubview(redView)
//        return redView
//    }
    
    
}
// Present the view controller in the Live View window

let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 375, height: 667)
PlaygroundPage.current.liveView = vc
// PlaygroundPage.current.liveView = MyViewController()
