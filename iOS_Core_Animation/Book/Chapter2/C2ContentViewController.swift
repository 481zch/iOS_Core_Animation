//
//  C2ContentViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/2.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

// layer - contents
final class C2ContentViewController: ZCHBaseViewController, ScrollControllProtocol {
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentViews = createContentViews()
        super.setContentViews(contentViews: contentViews)
    }
    
    func createContentViews() -> [UIView] {
        var contentViews: [UIView] = []
        contentViews.append(createView3())
        return contentViews
//        return createViews()
    }
    
    private func createView1() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        let layer = CALayer()
        layer.frame = CGRect(x: AppConstants.width / 2.0 - 50.0, y: AppConstants.height / 2.0 - 50.0, width: 100.0, height: 100.0)
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
        return view
    }
    
    // content rect
    private func createViews() -> [UIView] {
        let views = (0..<4).map { _ in UIView() }
        let subViews = (0..<4).map { _ in UIView(frame: CGRect(200, 200)) }
        let image = UIImage(named: "combine4")!
        addSpriteImage(image, CGRectMake(0.0, 0.0, 0.5, 0.5), subViews[0].layer)
        addSpriteImage(image, CGRectMake(0.5, 0.0, 0.5, 0.5), subViews[1].layer)
        addSpriteImage(image, CGRectMake(0.0, 0.5, 0.5, 0.5), subViews[2].layer)
        addSpriteImage(image, CGRectMake(0.5, 0.5, 0.5, 0.5), subViews[3].layer)
        
        for (index, elem) in views.enumerated() {
            elem.addSubview(subViews[index])
            subViews[index].snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(200)
            }
        }
        
        return views
    }
    
    private func addSpriteImage(_ image: UIImage, _ rect: CGRect, _ layer: CALayer) {
        layer.contents = image.cgImage
//        layer.contentsGravity = .resizeAspectFill
        layer.contentsRect = rect
    }
    
    // 为什么现在中心区域没有显示出来: 因为没有正确设置scale
    // contentsCenter究竟是什么，有什么作用，有哪些常被使用的地方
    // 用于设置在bounds和图像size不一致的时候，如何进行缩放，确定缩放区域
    private func createView3() -> UIView {
        let view = UIView()
        let subview = UIView()
        
        let image = UIImage(named: "mountain")!
        subview.layer.contentsScale = UIScreen.main.scale
        subview.layer.contents = image.cgImage
        subview.layer.contentsCenter = CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5)
        
        view.addSubview(subview)
        subview.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(image.size.width)
            make.height.equalTo(image.size.height)
        }
        
        print("subview's size: ", subview.frame.size)
        print("image's size: ", image.size)
        
        let addButton = UIButton()
        addButton.backgroundColor = .blue
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.equalToSuperview().offset(-50)
            make.top.equalTo(subview.snp.bottom).offset(20)
        }
        addButton.rx.tap.subscribe { _ in
            subview.snp.remakeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalTo(subview.bounds.width + 100)
                make.height.equalTo(image.size.height)
            }
        }.disposed(by: bag)
        
        let delButton = UIButton()
        delButton.backgroundColor = .blue
        view.addSubview(delButton)
        delButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.equalToSuperview().offset(50)
            make.top.equalTo(subview.snp.bottom).offset(20)

        }
        delButton.rx.tap.subscribe { _ in
            subview.snp.remakeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalTo(subview.bounds.width - 100)
                make.height.equalTo(image.size.height)
            }
        }.disposed(by: bag)
        
        return view
    }
}
