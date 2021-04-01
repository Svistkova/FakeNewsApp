//
//  ImageKey.swift
//  FakeNews
//
//  Created by Marina Svistkova on 30.03.2021.
//

import UIKit

enum ImageKey {

    enum Cells: String {
        case videoCellImage = "video_image"
    }
}


extension RawRepresentable where RawValue == String {
    var image: UIImage {
        return UIImage(named: rawValue, in: Bundle.main, compatibleWith: nil) ?? UIImage()
    }
}
