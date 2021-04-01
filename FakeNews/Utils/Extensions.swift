//
//  Extensions.swift
//  FakeNews
//
//  Created by Marina Svistkova on 29.03.2021.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}


