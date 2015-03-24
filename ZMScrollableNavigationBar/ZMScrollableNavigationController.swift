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
      var topOffset = min(max(newTopOffset, minTopOffset), maxTopOffset)
      if topOffset != self.topOffset {
        var frame = self.view.frame
        frame.origin.y = CGFloat(topOffset)
        frame.size.height = self.view.superview!.frame.size.height + CGFloat(-topOffset)
        println("New Frame: " + NSStringFromCGRect(self.view.frame))
        self.view.frame = frame
      }
    }
    get {
      return self.view.frame.origin.y
    }
  }
}