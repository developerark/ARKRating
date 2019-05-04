//
//  ARKRating.swift
//  ARKRating
//
//  Created by Aswin Raj Kharel on 5/3/19.
//  Copyright © 2019 Aswin Raj Kharel. All rights reserved.
//

import UIKit

public class ARKRatingControl: UIControl{
    let backgroundLayer = CAShapeLayer()
    let ratingLayer = CAShapeLayer()
    let foregroundLayer = CAShapeLayer()
    
    public var rating: CGFloat = 0.5
    public var maxRating: Int = 5
    public var ratingBorderColor: UIColor = .darkGray
    private var ratingBorderWidth: CGFloat = 0

    public var ratingColor: UIColor = .orange
    
    public var ratingInnerColor: UIColor = .lightGray
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    private func setup(){
        
        // Calculations
        var positions = [CGRect]()
        let sectionWidth = self.bounds.width / CGFloat(self.maxRating)
        let width = self.bounds.height - self.ratingBorderWidth
        let height = width
        for i in 0...self.maxRating - 1{
            let center = CGPoint(x: CGFloat(i) * sectionWidth + sectionWidth / 2, y: self.bounds.height / 2)
            let position = CGRect(x: center.x - width / 2, y: center.y - height / 2, width: width, height: height)
            positions.append(position)
        }
        
        // Setup maskPath
        let maskPath = UIBezierPath()
        for position in positions{
            maskPath.append(getStarPath(rect: position))
        }
        
        // Setup backgroundLayer
        let backgroundLayerPath = UIBezierPath()
        backgroundLayerPath.move(to: CGPoint(x: 0, y: self.bounds.midY))
        backgroundLayerPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.midY))
        self.backgroundLayer.path = backgroundLayerPath.cgPath
        self.backgroundLayer.strokeColor = self.ratingInnerColor.cgColor
        self.backgroundLayer.lineWidth = self.bounds.height
        self.layer.addSublayer(self.backgroundLayer)
        
        let backgroundLayerMask = CAShapeLayer()
        backgroundLayerMask.path = maskPath.cgPath
        backgroundLayerMask.strokeColor = self.ratingBorderColor.cgColor
        backgroundLayerMask.fillColor = self.ratingInnerColor.cgColor
        backgroundLayerMask.lineWidth = self.ratingBorderWidth
        backgroundLayerMask.lineJoin = .round
        backgroundLayerMask.lineCap = .round
        
        self.backgroundLayer.mask = backgroundLayerMask
        
        // Setup ratingLayer
        let ratingLayerPath = UIBezierPath()
        ratingLayerPath.move(to: CGPoint(x: 0, y: self.bounds.midY))
        ratingLayerPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.midY))
        self.ratingLayer.path = ratingLayerPath.cgPath
        self.ratingLayer.strokeColor = self.ratingColor.cgColor
        self.ratingLayer.lineWidth = self.bounds.height
        self.ratingLayer.strokeEnd = self.rating
        self.layer.addSublayer(self.ratingLayer)
        
        let ratingMaskLayer = CAShapeLayer()
        ratingMaskLayer.path = maskPath.cgPath
        ratingMaskLayer.strokeColor = self.ratingBorderColor.cgColor
        ratingMaskLayer.fillColor = self.ratingInnerColor.cgColor
        ratingMaskLayer.lineWidth = self.ratingBorderWidth
        ratingMaskLayer.lineJoin = .round
        ratingMaskLayer.lineCap = .round
        
        self.ratingLayer.mask = ratingMaskLayer
        
        // Setup foregroundLayer
        self.foregroundLayer.path = maskPath.cgPath
        self.foregroundLayer.strokeColor = self.ratingBorderColor.cgColor
        self.foregroundLayer.fillColor = nil
        self.foregroundLayer.lineWidth = self.ratingBorderWidth
        self.foregroundLayer.lineJoin = .round
        self.foregroundLayer.lineCap = .round
        self.layer.addSublayer(self.foregroundLayer)
    }
    
    private func getStarPath(rect: CGRect) -> UIBezierPath{
        func getTranslation(rect: CGRect, point: CGPoint) -> CGPoint{
            return CGPoint(x: rect.origin.x + point.x * rect.size.width, y: rect.origin.y + point.y * rect.size.height)
        }
        
        let p1 = CGPoint(x: 0.5, y: 0)
        let p2 = CGPoint(x: 0.3789, y: 0.3789)
        let p3 = CGPoint(x: 0, y: 0.3789)
        let p4 = CGPoint(x: 0.3125, y: 0.5996)
        let p5 = CGPoint(x: 0.1914, y: 0.9648)
        let p6 = CGPoint(x: 0.5, y: 0.7695)
        let p7 = CGPoint(x: 0.8066, y: 0.9648)
        let p8 = CGPoint(x: 0.6914, y: 0.5996)
        let p9 = CGPoint(x: 1.0, y: 0.3789)
        let p10 = CGPoint(x: 0.6309, y: 0.3789)
        
        let path = UIBezierPath()
        path.move(to: getTranslation(rect: rect, point: p1))
        path.addLine(to: getTranslation(rect: rect, point: p2))
        path.addLine(to: getTranslation(rect: rect, point: p3))
        path.addLine(to: getTranslation(rect: rect, point: p4))
        path.addLine(to: getTranslation(rect: rect, point: p5))
        path.addLine(to: getTranslation(rect: rect, point: p6))
        path.addLine(to: getTranslation(rect: rect, point: p7))
        path.addLine(to: getTranslation(rect: rect, point: p8))
        path.addLine(to: getTranslation(rect: rect, point: p9))
        path.addLine(to: getTranslation(rect: rect, point: p10))
        path.addLine(to: getTranslation(rect: rect, point: p1))
        
        return path
    }
}
