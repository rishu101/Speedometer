//
//  ViewController.swift
//  speedometer
//
//  Created by Rishu Agrawal on 07/09/17.
//  Copyright © 2017 Time Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var speedometerBackground: UIImageView!
	@IBOutlet weak var needle: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		speedometerBackground.image = UIImage(named: "needle.png")
		speedometerBackground.contentMode = .ScaleAspectFill
//		needle.image = UIImage(contentsOfFile: "needle.png")
//		needle.contentMode = .ScaleAspectFill
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func getAngle(speed: Double) -> Double {
		var angle: Double = Double()
		let unitAngle = 1.5
		angle = unitAngle*speed
		return angle
	}


}

