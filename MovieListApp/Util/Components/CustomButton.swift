//
//  CustomButton.swift
//  MovieListApp
//
//  Created by Valued Customer on 16/08/23.
//

import Foundation
import UIKit


class CustomButton: UIButton {
 
    var style: ButtonStyle = .primary{
        didSet {
            applyStyle()
        }
    }
    
    override init(frame: CGRect) {
       // self.style = style
        super.init(frame: frame)
        setup()
    }
    
  
    init(_ style: ButtonStyle = .primary) {
        super.init(frame: .zero)
        self.style = style
        setup()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup() {
        titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 8
        applyStyle()
    }
    func applyStyle() {
        setTitleColor(style.textColor, for: .normal)
        setTitleColor(style.disabledTextColor, for: .disabled)
        backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
        layer.borderWidth = isEnabled && style.hasBorder ? 1.2 : 0
        layer.borderColor = style.borderColor
     }
    func setEnabled() {
        layer.borderWidth = isEnabled && style.hasBorder ? 1.2 : 0
        backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
    }
    
    override var isEnabled: Bool {
        didSet {
            setEnabled()
        }
     }
}
