//
//  MovingArcs.swift
//  movingArcs
//
//  Created by Michał Bagrowski on 20/07/2020.
//  Copyright © 2020 gmbDev. All rights reserved.
//

import UIKit

class MovingArcs: UIView {
    var path: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var movement: CAKeyframeAnimation!

    // set path for moving and draw it on screen
    func pathShapeLayer() -> UIBezierPath {
        let startDegree = 180.0
        let endDegree = 360.0
        let start = CGFloat(startDegree).toRadians()
        let end = CGFloat(endDegree).toRadians()

        path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100),
            radius: 100.0,
            startAngle: start,
            endAngle: end,
            clockwise: true)

        let pathShapeLayer = CAShapeLayer()
        pathShapeLayer.path = path.cgPath
        pathShapeLayer.fillColor = UIColor.clear.cgColor
        pathShapeLayer.lineWidth = CGFloat(4)
        pathShapeLayer.strokeColor = UIColor.red.cgColor
        pathShapeLayer.position = .init(x: 0, y: 0)

        self.layer.addSublayer(pathShapeLayer)

        return path
    }

    // set movemnet along path with rotation
    func addAnimation() {
        let movement = CAKeyframeAnimation(keyPath: "position")
        movement.path = pathShapeLayer().cgPath
        movement.duration = 3
        movement.repeatCount = 1
        movement.rotationMode = CAAnimationRotationMode.rotateAuto
        movement.calculationMode = CAAnimationCalculationMode.paced
        movement.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        self.movement = movement
    }

    // set path for arc that will be moving
    func movingArc() -> UIBezierPath {
        let startDegree = 180.0
        let endDegree = 210.0
        let start = CGFloat(startDegree).toRadians()
        let end = CGFloat(endDegree).toRadians()

        let arcPath = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100),
            radius: 100.0,
            startAngle: start,
            endAngle: end,
            clockwise: true)

        return arcPath
    }

    // draw shapeLayer for moving arc
    func movingArcLayer() -> CAShapeLayer {
        let color = UIColor.green

        let backgroundCircleLayer = CAShapeLayer()
        backgroundCircleLayer.path = movingArc().cgPath
        backgroundCircleLayer.fillColor = UIColor.clear.cgColor
        backgroundCircleLayer.strokeColor = color.cgColor
        backgroundCircleLayer.lineWidth = 4.0
        backgroundCircleLayer.position = CGPoint(x: 100, y: 0)
        backgroundCircleLayer.transform = CATransform3DMakeTranslation(-100, 0, 0)
     //   backgroundCircleLayer.transform = CATransform3DMakeRotation(CGFloat(-180).toRadians(), 0, 0, 1)

        self.layer.addSublayer(backgroundCircleLayer)

        return backgroundCircleLayer
    }

    // init for animation
    func initiateAnimation() {
        let layer = movingArcLayer()
        layer.add(self.movement, forKey: "Object Movement")
    }

    init() {
        super.init(frame: .zero)
        addAnimation()
        movingArcLayer()
        initiateAnimation()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
