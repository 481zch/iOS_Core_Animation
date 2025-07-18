//
//  C2ContentsCustomDrawViewController
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/2.
//

import UIKit
import SnapKit
import Then
import RxSwift

final class C2ContentsCustomDrawViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
//        view.backgroundColor = .white
//        let view1 = CustomView()
//        view.addSubview(view1)
//        view1.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
        
        view.backgroundColor = .white
        let layer = CALayer()
        layer.bounds.size = CGSizeMake(100, 100)
        layer.backgroundColor = UIColor.blue.cgColor
        layer.delegate = self
        layer.contentsScale = UIScreen.main.scale
        layer.position = view.center
        
        view.layer.addSublayer(layer)
        layer.display()
    }
    
    // 通过draw Rect
    private class CustomView: UIView {
        override func draw(_ rect: CGRect) {
            let bezier = UIBezierPath(rect: rect)
            UIColor.blue.setFill()
            bezier.fill()
        }
    }
}

extension C2ContentsCustomDrawViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setFillColor(UIColor.blue.cgColor)
        ctx.fill(layer.bounds)
    }
}
