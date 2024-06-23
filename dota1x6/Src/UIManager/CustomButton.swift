//
//  CustomButton.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 23.06.2024.
//

import Foundation
import UIKit

class GradientButton: UIButton {
    
    private var gradientLayer: CAGradientLayer?
    
    var gradientColors: [CGColor]? {
        didSet {
            setGradientBackground()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer?.frame = bounds
    }
    
    private func setGradientBackground() {
        gradientLayer?.removeFromSuperlayer()
        
        if let colors = gradientColors {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.cornerRadius = self.layer.cornerRadius
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.frame = self.bounds
            
            self.layer.insertSublayer(gradientLayer, at: 0)
            self.gradientLayer = gradientLayer
        }
    }
}
