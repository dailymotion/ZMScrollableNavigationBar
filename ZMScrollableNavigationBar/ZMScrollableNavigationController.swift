//
//  ZMScrollableNavigationController.swift
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/23/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

import UIKit

let maxTopOffset: CGFloat = 0.0
let minTopOffset: CGFloat = -44.0

extension UINavigationController {
  var topOffset: CGFloat {
    set(newTopOffset) {
      if self.navigationBarHidden {
        return
      }
      
      var topOffset: CGFloat = newTopOffset
      
      switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) {
      case .OrderedSame, .OrderedDescending:break
      case .OrderedAscending:
        // iOS < 8.0.0 not supported at the time
        topOffset = 0.0
        return
      }
      
      // Adjust to the presence of a UIStatusBar
      if !UIApplication.sharedApplication().statusBarHidden {
        topOffset -= CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
      }
      
      // Adjust so that the view doesn't scroll below the UINavigationBar before it starts hiding
      topOffset -= CGRectGetHeight(self.navigationBar.frame)
      
      topOffset = min(max(topOffset, minTopOffset), maxTopOffset)
      if topOffset != self.topOffset {
        var frame = self.view.frame
        frame.origin.y = CGFloat(topOffset)
        frame.size.height = self.view.superview!.frame.size.height + CGFloat(-topOffset)
        self.view.frame = frame
      }
    }
    get {
      return self.view.frame.origin.y
    }
  }
}