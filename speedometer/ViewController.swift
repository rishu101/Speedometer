//
//  ViewController.swift
//  speedometer
//
//  Created by Rishu Agrawal on 07/09/17.
//  Copyright © 2017 Time Inc. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	
	var needle: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "needle1")
		imageView.contentMode = .ScaleAspectFit
		return imageView
	}()

	override func viewDidLoad() {
		view.addSubview(needle)
		layout()
		rotate(170)
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func layout() {
		needle.snp_makeConstraints{ (make) -> Void in
			make.height.equalTo(150)
			make.width.equalTo(150)
			make.centerX.equalTo(view.snp_centerX)
			make.centerY.equalTo(view.snp_centerY)
		}
	}
	
	func rotate(speed: Double) {
//		while(true) {
			let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
			rotationAnimation.fromValue = 0.0
			rotationAnimation.toValue = degreeToRadian(getAngle(speed))
			rotationAnimation.duration = 5.0
			needle.layer.anchorPoint = CGPointMake(1, 0.5)
		
			self.needle.layer.addAnimation(rotationAnimation, forKey: nil)
//		}
	}
	
	func degreeToRadian(degree: Double) -> Double {
		return (degree * M_PI) / 180
	}
	
	func getAngle(speed: Double) -> Double {
		var angle: Double = Double()
		let unitAngle = 1.5
		angle = unitAngle*speed
		return angle
	}
}

