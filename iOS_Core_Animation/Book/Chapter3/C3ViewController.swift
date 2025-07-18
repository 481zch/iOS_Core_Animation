//
//  C3ViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/18.
//

import UIKit
import SnapKit
import RxSwift
import Then

final class C3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
//    private func setupSubviews() {
//        let layer1 = CALayer().then {
//            $0.backgroundColor = UIColor.red.cgColor
//            $0.bounds.size = CGSizeMake(100, 100)
//        }
//        layer1.position = view.center
//        
//        let layer2 = CALayer().then {
//            $0.backgroundColor = UIColor.green.cgColor
//            $0.bounds.size = CGSizeMake(100, 100)
//        }
//        layer2.position = CGPoint(x: view.center.x + 20, y: view.center.y + 20)
//        
//        view.layer.addSublayer(layer1)
//        view.layer.addSublayer(layer2)
//        
////        layer1.zPosition = 1.0
//    }
    
    private let layerView = UIView()
    private let blueLayer = CALayer()
    
    private func setupSubviews() {
        view.backgroundColor = .gray

        layerView.frame = CGRectMake(50, 50, 200, 200)
        layerView.backgroundColor = .white
        
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(blueLayer)
        
        view.addSubview(layerView)
        layerView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
    // point convert contains
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touchPoint = touches.first?.location(in: view) else { return }
//        
//        let whiteLayerPoint = layerView.layer.convert(touchPoint, from: view.layer)
//        if layerView.layer.contains(whiteLayerPoint) {
//            let blueLayerPoint = blueLayer.convert(whiteLayerPoint, from: layerView.layer)
//            
//            let alertTitle: String
//            if blueLayer.contains(blueLayerPoint) {
//                alertTitle = "blue"
//            } else {
//                alertTitle = "white"
//            }
//            
//            let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alert, animated: true)
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        
        if let hitLayer = view.layer.hitTest(touchPoint) {
            var message = "unknown"
            
            switch hitLayer {
            case blueLayer:
                message = "blue"
            case layerView.layer:
                message = "white"
            default:
                break
            }
            let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
