//
//  Buttons.swift
//  swift_test_FileManager
//
//  Created by Evgeniy Akhmerov on 27/06/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import UIKit.UIButton

class IconedButton: UIButton {
    
    private struct Constants {
        static let spacer: CGFloat = 12
    }
    
    var icon: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let _icon = icon else { return }
        setImage(_icon, for: .normal)
        
        contentEdgeInsets = UIEdgeInsetsMake(0, -Constants.spacer, 0, 0)
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, Constants.spacer)
    }
}

class CheckmarkButton: IconedButton {
    
    override func awakeFromNib() {
        icon = #imageLiteral(resourceName: "ic_checkmark")
        
        super.awakeFromNib()
    }
}

class CrossButton: IconedButton {
    
    override func awakeFromNib() {
        icon = #imageLiteral(resourceName: "ic_cross")
        
        super.awakeFromNib()
    }
}
