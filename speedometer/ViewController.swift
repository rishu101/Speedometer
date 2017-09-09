//
//  ViewController.swift
//  speedometer
//
//  Created by Rishu Agrawal on 07/09/17.
//  Copyright © 2017 Time Inc. All rights reserved.
//

import UIKit
import SnapKit
import Bond

class ViewController: UIViewController {
	
	var speedometerBackground: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "speedometer2")
		imageView.contentMode = .ScaleAspectFit
		return imageView
	}()
	
	var speedTextBox = UITextField()
	var goButton: UIButton = {
		let button = UIButton()
		button.setTitle("GO", forState: .Normal)
		button.setTitleColor(UIColor.redColor(), forState: .Normal)
		button.enabled = true
		return button
	}()

	var needle: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "needle1")?.imageWithRenderingMode(.AlwaysTemplate)
		imageView.tintColor = UIColor.redColor()
		imageView.contentMode = .ScaleAspectFit
		return imageView
	}()
	
	override func viewDidLoad() {
		speedometerBackground.addSubview(needle)
		view.addSubview(speedometerBackground)
		view.addSubview(speedTextBox)
		view.addSubview(goButton)
		layout()
		goButton.addTarget(self, action: "rotate", forControlEvents: .TouchUpInside)
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func layout() {
		needle.snp_makeConstraints{ (make) -> Void in
			make.height.equalTo(100)
			make.width.equalTo(100)
			make.centerX.equalTo(view.snp_centerX).offset(0)
			make.centerY.equalTo(view.snp_centerY).offset(-40)
		}
		speedometerBackground.snp_makeConstraints{ (make) -> Void in
			make.height.equalTo(300)
			make.width.equalTo(300)
			make.centerX.equalTo(view.snp_centerX)
			make.centerY.equalTo(view.snp_centerY).offset(-70)
		}
		speedTextBox.backgroundColor = UIColor.blackColor()
		speedTextBox.textColor = UIColor.whiteColor()
		speedTextBox.snp_makeConstraints{ (make) -> Void in
			make.top.equalTo(speedometerBackground.snp_bottom).offset(50)
			make.width.equalTo(100)
			make.height.equalTo(30)
			make.centerX.equalTo(view.snp_centerX)
		}
		goButton.snp_makeConstraints{ (make) -> Void in
			make.top.equalTo(speedTextBox.snp_bottom).offset(5)
			make.width.equalTo(50)
			make.height.equalTo(30)
			make.centerX.equalTo(view.snp_centerX)
		}
	}
	
	//Max speed 260, Min speed 0
	func rotate() {
		let speed = Double(speedTextBox.text!)!
		if speed <= 300 {
			let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
			rotationAnimation.fromValue = 0.0
			rotationAnimation.toValue = degreeToRadian(getAngle(speed))
			rotationAnimation.duration = 2.0
			needle.layer.anchorPoint = CGPointMake(0.8, 0.2)
			needle.layer.addAnimation(rotationAnimation, forKey: "nil")
		}
	}
	
	func degreeToRadian(degree: Double) -> Double {
		return (degree * M_PI) / 180
	}
	
	func getAngle(speed: Double) -> Double {
		var angle: Double = Double()
		let unitAngle = Double(360.00/390.00)
		angle = unitAngle*speed
		return angle
	}
}