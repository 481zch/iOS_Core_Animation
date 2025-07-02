//
//  CGRect + Extension.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/6/24.
//

import UIKit

extension CGRect {
    init(_ width: CGFloat = CGFloat(AppConstants.width), _ height: CGFloat = CGFloat(AppConstants.height)) {
        self.init(x: 0, y: 0, width: width, height: height)
    }
}
