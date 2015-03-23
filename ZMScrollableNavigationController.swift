//
//  ZMScrollableNavigationController.swift
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/23/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

import UIKit

class ZMScrollableNavigationController: UINavigationController {
  var maxTopOffset = 0.0
  var minTopOffset = -44.0
  var topOffset: Double = 0.0 {
    didSet {
      switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) {
      case .OrderedSame, .OrderedDescending:
        break
      case .OrderedAscending:
        // iOS < 8.0.0 not supported at the time
        topOffset = 0.0
      }
      topOffset = min(max(topOffset, minTopOffset), maxTopOffset)
      if topOffset != oldValue {
        println("Top Offset: \(topOffset)")
        var frame = self.view.frame
        frame.origin.y = CGFloat(topOffset)
        frame.size.height = self.view.window!.frame.size.height + CGFloat(-topOffset)
        println("New Frame: " + NSStringFromCGRect(self.view.frame))
        self.view.frame = frame
      }
    }
  }
}
