//
//  C2ContentsImageViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/18.
//

import UIKit
import SnapKit
import RxSwift
import Then

// 默认图像展示
//final class C2ContentsImageViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let layer = CALayer()
//        layer.contents = UIImage(named: "mountain")?.cgImage
//        layer.contentsGravity = .resizeAspect
//        layer.bounds = CGRectMake(0, 0, 200, 200)
//        layer.position = view.center
//        view.layer.addSublayer(layer)
//        let label = UILabel()
//        label.text = "display a image in layer"
//        label.textColor = .black
//        view.addSubview(label)
//        label.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().inset(200)
//            make.centerX.equalToSuperview()
//        }
//    }
//}

//// 大图裁剪
//final class C2ContentsImageViewController: ScrollControllViewController, ScrollControllProtocol {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let contentViews = createContentViews()
//        super.setContentViews(contentViews: contentViews)
//    }
//    
//    func createContentViews() -> [UIView] {
//        var contentViews: [UIView] = []
//        let image = UIImage(named: "combine4")!
//        
//        contentViews.append(createView1(image, CGRectMake(0, 0, 0.5, 0.5)))
//        contentViews.append(createView2(image, CGRectMake(0, 0.5, 0.5, 0.5)))
//        contentViews.append(createView3(image, CGRectMake(0.5, 0, 0.5, 0.5)))
//        contentViews.append(createView4(image, CGRectMake(0.5, 0.5, 0.5, 0.5)))
//        return contentViews
//    }
//    
//    private func createView1(_ iamge: UIImage, _ rect: CGRect) -> UIView {
//        let view = UIView()
//        let layer = CALayer()
//        layer.bounds = CGRectMake(0, 0, 100, 100)
//        layer.position = view.center
//        layer.contents = iamge.cgImage
//        layer.contentsGravity = .resizeAspect
//        layer.contentsRect = rect
//        view.layer.addSublayer(layer)
//        return view
//    }
//    
//    private func createView2(_ iamge: UIImage, _ rect: CGRect) -> UIView {
//        let view = UIView()
//        let layer = CALayer()
//        layer.bounds = CGRectMake(0, 0, 100, 100)
//        layer.position = view.center
//        layer.contents = iamge.cgImage
//        layer.contentsGravity = .resizeAspect
//        layer.contentsRect = rect
//        view.layer.addSublayer(layer)
//        return view
//    }
//    
//    private func createView3(_ iamge: UIImage, _ rect: CGRect) -> UIView {
//        let view = UIView()
//        let layer = CALayer()
//        layer.bounds = CGRectMake(0, 0, 100, 100)
//        layer.position = view.center
//        layer.contents = iamge.cgImage
//        layer.contentsGravity = .resizeAspect
//        layer.contentsRect = rect
//        view.layer.addSublayer(layer)
//        return view
//    }
//    
//    private func createView4(_ iamge: UIImage, _ rect: CGRect) -> UIView {
//        let view = UIView()
//        let layer = CALayer()
//        layer.bounds = CGRectMake(0, 0, 100, 100)
//        layer.position = view.center
//        layer.contents = iamge.cgImage
//        layer.contentsGravity = .resizeAspect
//        layer.contentsRect = rect
//        view.layer.addSublayer(layer)
//        return view
//    }
//}

final class C2ContentsImageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        let image = UIImage(named: "mountain")!
        let layer = CALayer()
        layer.contents = image.cgImage
        layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5)
        layer.bounds.size = CGSizeMake(200, 200)
        layer.position = view.center
        view.layer.addSublayer(layer)
    }
}
