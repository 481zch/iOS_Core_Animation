//
//  C1ViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/18.
//

import UIKit
import SnapKit
import RxSwift
import Then

final class C1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        let layer = CALayer()
        layer.bounds = CGRectMake(0, 0, 100, 100)
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
    }
}
 
