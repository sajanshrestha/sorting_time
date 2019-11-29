//
//  ViewController.swift
//  Sort It Out
//
//  Created by Sajan Shrestha on 9/13/19.
//  Copyright © 2019 Sajan Shrestha. All rights reserved.
//

import UIKit
import SwiftUI

struct CompareView: UIViewControllerRepresentable {
        
    var algorithms: [Algorithm]
    
    func makeUIViewController(context: Context) -> CompareViewController {
        
        let viewController = CompareViewController()
        viewController.threeComparableAlgorithms = algorithms
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: CompareViewController, context: UIViewControllerRepresentableContext<CompareView>) {
        
    }
    
}

class CompareViewController: UIViewController {
    
    // three views that compares selected three algorithms
    var viewOne: UIView = {
        var view = UIView()
        return view
    }()
    
    var viewTwo: UIView = {
        var view = UIView()
        return view
    }()
    
    var viewThree: UIView = {
        var view = UIView()
        return view
    }()
    
    let layerOne = CAShapeLayer()
    let layerTwo = CAShapeLayer()
    let layerThree = CAShapeLayer()
    
    let textLayerOne = CATextLayer()
    let textLayerTwo = CATextLayer()
    let textLayerThree = CATextLayer()
    
    var threeComparableAlgorithms: [Algorithm]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.7504013271)
        
        guard let algorithms = threeComparableAlgorithms else {return}
        
        setUpViewsAndLayers()
        
        addAnimations(forAlgorithms: algorithms)

        let tapGestureOne = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureOne)
        
    }
    
    func setUpViewsAndLayers() {
        
        guard let algorithms = threeComparableAlgorithms else {return}

        viewOne.frame = CGRect(x: 0, y: Constants.ViewStartingYPosition, width: view.bounds.width, height: Constants.HEIGHT)
        viewTwo.frame = CGRect(x: 0, y: Constants.ViewStartingYPosition + Constants.HEIGHT, width: view.bounds.width, height: Constants.HEIGHT)
        viewThree.frame = CGRect(x: 0, y: Constants.ViewStartingYPosition + (2 * Constants.HEIGHT), width: view.bounds.width, height: Constants.HEIGHT)
            
        setUpALayer(for: layerOne, textLayer: textLayerOne)
        textLayerOne.string = "\(algorithms[0].name)\n\(algorithms[0].duration) nanoseconds"
        
        setUpALayer(for: layerTwo, textLayer: textLayerTwo)
        textLayerTwo.string = "\(algorithms[1].name)\n\(algorithms[1].duration) nanoseconds"
        
        setUpALayer(for: layerThree, textLayer: textLayerThree)
        textLayerThree.string = "\(algorithms[2].name)\n\(algorithms[2].duration) nanoseconds"
        
        addViews()
        addLayers()
        
    }
    
    func addViews() {
        view.addSubview(viewOne)
        view.addSubview(viewTwo)
        view.addSubview(viewThree)
    }
    
    func addLayers() {
        viewOne.layer.addSublayer(layerOne)
        viewTwo.layer.addSublayer(layerTwo)
        viewThree.layer.addSublayer(layerThree)
    }
    
    func addAnimations(forAlgorithms algorithms: [Algorithm]) {
        
        let animationOne = animationFor(algorithm: algorithms[0])
        let animationTwo = animationFor(algorithm: algorithms[1])
        let animationThree = animationFor(algorithm: algorithms[2])
        
        layerOne.add(animationOne, forKey: "stromeEnd")
        layerTwo.add(animationTwo, forKey: "strokeEnd")
        layerThree.add(animationThree, forKey: "strokeEnd")
        
        
    }
    
    func setUpALayer(for layer: CAShapeLayer, textLayer: CATextLayer) {
        
        let pathOne = UIBezierPath(arcCenter: CGPoint(x: viewOne.bounds.width / 2, y: viewOne.bounds.height / 2 ), radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = pathOne.cgPath
        layer.lineWidth = 5
        layer.lineCap = .round
        layer.strokeEnd = 0
        layer.fillColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
        layer.strokeColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        let shadowPath =  UIBezierPath(arcCenter: CGPoint(x: viewOne.bounds.width / 2, y: viewOne.bounds.height / 2 ), radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        layer.shadowPath = shadowPath
        
        layer.addSublayer(textLayer)
        textLayer.position = CGPoint(x: view.center.x, y: viewOne.bounds.height / 2)
        textLayer.alignmentMode = .center
        textLayer.fontSize = 16
        textLayer.bounds.size = CGSize(width: 200, height: 40)
    }
    
    func animationFor(algorithm: Algorithm) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = getCalculatedAnimationTime(forAlgorithm: algorithm)
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func getCalculatedAnimationTime(forAlgorithm algorithm: Algorithm) -> Double {
        
        if let algorithms = threeComparableAlgorithms {
            let totalTime = algorithms[0].duration + algorithms[1].duration + algorithms[2].duration
            return (algorithm.duration / totalTime) * 10
        }
        else {
            return 0.0
        }
    }

    @objc func handleTap() {
        
        guard let algorithms = threeComparableAlgorithms else {return}
        
        addAnimations(forAlgorithms: algorithms)
    }

  
}

