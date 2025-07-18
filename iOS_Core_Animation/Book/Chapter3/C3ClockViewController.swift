//
//  C3ClockViewController.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/3.
//

import UIKit
import SnapKit
import Then

/*
 绘制一个钟表并且移动，通过改变anchorPoint进行对齐
 */

final class C3ClockViewController: UIViewController {
    
    let dialPlate = DialPlate().then {
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(dialPlate)
        
        dialPlate.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(270)
        }
    }

}

class DialPlate: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        let lineWidth: CGFloat = 4.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) * 0.5 - lineWidth
        let tickWidth: CGFloat  = 4.0
        let tickLength: CGFloat = 8.0
        ctx.setLineWidth(lineWidth)
        UIColor.black.setStroke()
        
        ctx.addEllipse(in: CGRect(
            x: center.x - radius,
            y: center.y - radius,
            width: radius * 2,
            height: radius * 2))
        ctx.strokePath()
                
        let rect12 = CGRect(
            x: center.x - tickWidth / 2.0,
            y: center.y - radius,
            width: tickWidth,
            height: tickLength
        )
        ctx.fill(rect12)
        
        let rect3 = CGRect(
            x: center.x + radius - tickLength,
            y: center.y - tickWidth / 2.0,
            width: tickLength,
            height: tickWidth
        )
        ctx.fill(rect3)
        
        let rect6 = CGRect(
            x: center.x - tickWidth / 2.0,
            y: center.y + radius - tickLength,
            width: tickWidth,
            height: tickLength
        )
        ctx.fill(rect6)
        
        let rect9 = CGRect(
            x: center.x - radius,
            y: center.y - tickWidth / 2.0,
            width: tickLength,
            height: tickWidth
        )
        ctx.fill(rect9)
        
        let clockCenter =  CGRect(
            x: center.x,
            y: center.y,
            width: 3.0,
            height: 3.0
        )
        ctx.addEllipse(in: clockCenter)
        ctx.fillPath()
    }
}

