//
//  C2ContentsByDrawViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/2.
//

import UIKit
import SnapKit
import Then
import RxSwift

/*
 主要就是看除了将UIImage.cgImage赋值给layer.contents，还可以通过自定义绘制逻辑来给layer的contents设置内容
 一般也没有机会用到吧
 */

final class C2ContentsByDrawViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CALayer()
        layer.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        layer.backgroundColor = UIColor.blue.cgColor
        
        layer.delegate = self
        
        view.layer.addSublayer(layer)
        layer.display()
    }
}

extension C2ContentsByDrawViewController: CALayerDelegate {
    // 在没有实现这个代理方法时会自动draw方法，并且带着context，寄宿图
//    func display(_ layer: CALayer) { }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
