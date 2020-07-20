//
//  AmountTextView.swift
//  ComponentsSample
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit

@IBDesignable
class AmountTextView: UIView {
    
    private static let defaultAmountFontSize: CGFloat = 15.0
    private var amountLabel = UILabel(frame: CGRect.zero)
    
    // configuarable properties
    open var font: UIFont? {
        didSet {
            if let font = self.font {
                amountLabel.font = font
                updateFrames()
            }
        }
    }
    
    open var textAlignment: NSTextAlignment = .right {
        didSet {
            amountLabel.textAlignment = textAlignment
        }
    }
    
    open var textColor: UIColor = .black {
        didSet {
            amountLabel.textColor = textColor
        }
    }
    
    override var frame: CGRect {
      didSet {
        updateFrames()
      }
    }
    // MARK: - Override Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func updateConstraints() {
      super.updateConstraints()
      updateFrames()
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      updateFrames()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    // MARK: - Setup And Update SubView
    open func configure(value: Double) {
        guard let currencyType = CurrencyConfig.shared?.currencyType else {
            return
        }
        let minimumFractionDigits = CurrencyConfig.shared?.minimumFractionDigits ?? 2
        var formattedValue = value.getAmountText(amount: fabs(value), minimumFractionDigits: minimumFractionDigits)
        
        formattedValue = value < 0 ? ("-" + currencyType.rawValue + "  " + formattedValue) : (currencyType.rawValue + "  " + formattedValue)
        let styledText = formattedValue.asStylizedPrice(using: amountLabel.font)
        
        amountLabel.attributedText = styledText
        amountLabel.textColor = value < 0 ? .red : amountLabel.textColor
    }
    
    private func setupView() {
        amountLabel.frame = bounds
        amountLabel.font = UIFont.systemFont(ofSize: AmountTextView.defaultAmountFontSize, weight: .medium)
        amountLabel.textColor = .black
        amountLabel.textAlignment = .right
        amountLabel.minimumScaleFactor = 0.4
        addSubview(amountLabel)
    }
    
    func updateFrames() {
      amountLabel.frame = bounds
    }
    
}
