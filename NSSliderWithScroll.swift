//
//  NSSliderWithScroll.swift
//
//  Created by Şafak Gezer on 13/10/15.
//  Copyright © 2015 Şafak Gezer. All rights reserved.
//

import Cocoa

class NSSliderWithScroll : NSSlider {

	override func scrollWheel(theEvent: NSEvent) {
		let delta = Double(theEvent.deltaY)
		let momentumPhase = theEvent.momentumPhase
		if momentumPhase != NSEventPhase.Changed && abs(delta) > 1.0 {
			let diff = Double(delta / 100 * (self.maxValue - self.minValue))
			self.doubleValue += diff
			if let target = self.target {
				target.performSelector(self.action, withObject: self)
			}
		}
	}
}