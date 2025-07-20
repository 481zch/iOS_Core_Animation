//
//  C5ViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/20.
//

import UIKit
import SnapKit
import RxSwift
import Then

final class C5ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
//    // 基本仿射变换 - CGAffineTransform
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let image = UIImage(named: "cat")!
//        let layer = CALayer()
//        layer.contents = image.cgImage
//        layer.bounds.size = CGSizeMake(100, 100)
//        layer.position = view.center
//        view.layer.addSublayer(layer)
//        
////         // 单位矩阵
////        let identity = CGAffineTransform.identity
////        let transform = CGAffineTransformMakeRotation(.pi / 4)s
////        let transform = CGAffineTransformMakeScale(2.0, 2.0)
//        let transform = CGAffineTransformMakeTranslation(5, 5)
//        layer.setAffineTransform(transform)
//    }
    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        // 3D变换
//        let image = UIImage(named: "mountain")
//        let layer = CALayer()
//        layer.contents = image?.cgImage
//        layer.bounds.size = CGSizeMake(100, 100)
//        layer.position = view.center
//        view.layer.addSublayer(layer)
//        
//        var identity = CATransform3DIdentity
//        // 设置透视效果
//        identity.m34 = -1.0 / 500.0
//        // 子图层设置
//        view.layer.sublayerTransform = identity
//        let transform = CATransform3DRotate(identity, .pi / 4, 0, 1, 0)
//        layer.transform = transform
//    }
//
//    // 视图扁平化
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let outerLayer = CALayer()
//        outerLayer.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
//        outerLayer.backgroundColor = UIColor.lightGray.cgColor
//
//        let innerLayer = CALayer()
//        innerLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
//        innerLayer.backgroundColor = UIColor.darkGray.cgColor
//
//        outerLayer.addSublayer(innerLayer)
//
//        var identity1 = CATransform3DIdentity
//        identity1.m34 = -1.0 / 500.0
//
//        var identity2 = CATransform3DIdentity
//        identity2.m34 = -1.0 / 500.0
//
//        outerLayer.transform = CATransform3DRotate(identity1, .pi / 4, 0, 1, 0)
//        innerLayer.transform = CATransform3DRotate(identity2, -.pi / 4, 0, 1, 0)
//
//        view.layer.addSublayer(outerLayer)
//    }
    
    private lazy var containerView = UIView()
    private lazy var view1 = createCubeView("1", .red)
    private lazy var view2 = createCubeView("2", .orange)
    private lazy var view3 = createCubeView("3", .yellow)
    private lazy var view4 = createCubeView("4", .green)
    private lazy var view5 = createCubeView("5", .blue)
    private lazy var view6 = createCubeView("6", .purple)
    private lazy var faces = [
        view1, view2, view3, view4, view5, view6
    ]
    
    // 关于光亮和阴影，使用GLKit，就暂时不写了。
    private func setupSubviews() {
        view.backgroundColor = .white

        var perspective: CATransform3D = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        containerView.layer.sublayerTransform = perspective

        // 面 1：前
        var transform = CATransform3DMakeTranslation(0, 0, 50)
        addFace(index: 0, transform: transform)

        // 面 2：右
        transform = CATransform3DMakeTranslation(50, 0, 0)
        transform = CATransform3DRotate(transform, .pi / 2, 0, 1, 0)
        addFace(index: 1, transform: transform)

        // 面 3：上
        transform = CATransform3DMakeTranslation(0, -50, 0)
        transform = CATransform3DRotate(transform, .pi / 2, 1, 0, 0)
        addFace(index: 2, transform: transform)

        // 面 4：下
        transform = CATransform3DMakeTranslation(0, 50, 0)
        transform = CATransform3DRotate(transform, -.pi / 2, 1, 0, 0)
        addFace(index: 3, transform: transform)

        // 面 5：左
        transform = CATransform3DMakeTranslation(-50, 0, 0)
        transform = CATransform3DRotate(transform, -.pi / 2, 0, 1, 0)
        addFace(index: 4, transform: transform)

        // 面 6：后
        transform = CATransform3DMakeTranslation(0, 0, -50)
        transform = CATransform3DRotate(transform, .pi, 0, 1, 0)
        addFace(index: 5, transform: transform)


        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.center.equalToSuperview()
        }
        
    }
    private func addFace(index: Int, transform: CATransform3D) {
        let face = faces[index]
        containerView.addSubview(face)
        let containerSize = containerView.bounds.size
        face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0)
        face.layer.transform = transform
    }
    
    private func createCubeView(_ text: String, _ color: UIColor) -> UIView {
        let view = UIView(frame: CGRectMake(0, 0, 100, 100))
        view.backgroundColor = color
        let label = UILabel().then {
            $0.text = text
            $0.font = .boldSystemFont(ofSize: 14)
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return view
    }
}
