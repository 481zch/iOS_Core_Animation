//
//  C4ViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/18.
//

import UIKit
import SnapKit
import RxSwift
import Then

final class C4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
//    // cornerRadius, border
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let imageView = UIImageView(image: UIImage(named: "mountain")).then {
//            $0.contentMode = .scaleAspectFit
//        }
//        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true
//        
//        imageView.layer.borderWidth = 5
//        imageView.layer.borderColor = UIColor.black.cgColor
//        
//        view.addSubview(imageView)
//        
//        imageView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
//            make.center.equalToSuperview()
//        }
//    }
    
//    // shadow
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let outView = UIView()
//        outView.layer.shadowOpacity = 0.5
//        outView.layer.shadowRadius = 10
//        outView.layer.shadowColor = UIColor.black.cgColor
//        view.addSubview(outView)
//        outView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
//            make.center.equalToSuperview()
//        }
//        
//        let inView = UIView()
//        inView.layer.cornerRadius = 20
//        inView.layer.masksToBounds = true
//        outView.addSubview(inView)
//        inView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        let imageView = UIImageView(image: UIImage(named: "cat")).then {
//            $0.contentMode = .scaleAspectFill
//            $0.backgroundColor = .white
//        }
//        inView.addSubview(imageView)
//        imageView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
//            make.center.equalToSuperview()
//        }
//    }
//    // shadowPath
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let imageView = UIImageView(image: UIImage(named: "cat")).then {
//            $0.contentMode = .scaleAspectFit
//        }
//        view.addSubview(imageView)
//        imageView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
//            make.center.equalToSuperview()
//        }
//        
//        let squarePath = UIBezierPath(rect: imageView.bounds)
//        imageView.layer.shadowPath = squarePath.cgPath
//        imageView.layer.shadowOpacity = 0.5
//    }
    
//    // mask: 需要注意选择带有透明通道的图片
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        
//        let subView = UIView()
//        subView.backgroundColor = .black
//        view.addSubview(subView)
//        subView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        let layer = CALayer()
//        layer.bounds = UIScreen.main.bounds
//        layer.contents = UIImage(named: "star")!.cgImage
//        layer.position = view.center
//        
//        subView.layer.mask = layer
//    }
    
//    // 拉伸过滤
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        
////        let stackView = UIStackView().then {
////            $0.axis = .horizontal
////            $0.spacing = 5
////        }
////        let views = loadDigitsView()
////        for elem in views {
////            stackView.addArrangedSubview(elem)
////        }
////        view.addSubview(stackView)
////        stackView.snp.makeConstraints { make in
////            make.height.equalTo(50)
////            make.width.equalTo(200)
////            make.center.equalToSuperview()
////        }
//        
//    }
    
//    // TODO: 不想慢慢调整了，后面有时间了再调整大小来展示出来吧
//    private func loadDigitsView() -> [UIView] {
//        var res: [UIView] = []
//        let image = UIImage(named: "number")!
//        
//        for i in 0...1 {
//            let view = UIView()
//            let layer = CALayer()
//            layer.contents = image.cgImage
//            layer.contentsRect = CGRect(x: CGFloat(i) * 20, y: 0, width: 20, height: 50)
//            view.frame = CGRect(x: 0, y: 0, width: 20, height: 50)
//            // 拉伸过滤
//            view.layer.magnificationFilter = .nearest
//            view.layer.addSublayer(layer)
//            res.append(view)
//        }
//        
//        return res
//    }
    
    // 组透明
    private func setupSubviews() {
        view.backgroundColor = .gray
        let button = UIButton().then {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 10
            $0.frame = CGRectMake(0, 0, 150, 50)
        }
        let label = UILabel().then {
            $0.text = "hello world"
            $0.textAlignment = .center
            $0.backgroundColor = .white
            $0.frame = CGRectMake(20, 8, 110, 30)
        }
        button.addSubview(label)
        button.center = CGPointMake(250, 150)
        button.alpha = 0.5
        view.addSubview(button)
        
        // 现在组透明由这个属性负责，默认是开启的
        button.layer.allowsGroupOpacity = false
    }
}
