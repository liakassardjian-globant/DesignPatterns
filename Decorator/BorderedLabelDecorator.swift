//
//  BorderedLabelDecorator.swift
//  Decorator
//
//  Created by Lia Kassardjian on 29/12/21.
//

import UIKit


/// Decorator for ``UILabel`` that wrapps an instance of ``UILabel``
class BorderedLabelDecorator: UILabel {
    fileprivate let wrappedLabel: UILabel
    
    required init(label: UILabel, cornerRadius: CGFloat = 3.0, borderWidth: CGFloat = 1.0, borderColor: UIColor = .black) {
        self.wrappedLabel = label
        
        super.init(frame: label.frame)
        
        wrappedLabel.layer.cornerRadius = cornerRadius
        wrappedLabel.layer.borderWidth = borderWidth
        wrappedLabel.layer.borderColor = borderColor.cgColor
        wrappedLabel.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var textAlignment: NSTextAlignment {
        get {
            return wrappedLabel.textAlignment
        }
        set {
            wrappedLabel.textAlignment = newValue
        }
    }
    
    override var backgroundColor: UIColor? {
        get {
            return wrappedLabel.backgroundColor
        }
        set {
            wrappedLabel.backgroundColor = newValue
        }
    }
    
    override var textColor: UIColor! {
        get {
            return wrappedLabel.textColor
        }
        set {
            wrappedLabel.textColor = newValue
        }
    }
    
    override var text: String? {
        get {
            return wrappedLabel.text
        }
        set {
            var str = " "
            if let newVal = newValue {
                str += newVal + str
            }
            wrappedLabel.text = str
        }
    }
    
    override var layer: CALayer {
        return wrappedLabel.layer
    }
}
