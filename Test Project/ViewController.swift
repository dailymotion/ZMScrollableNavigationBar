//
//  ViewController.swift
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/23/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    if self.navigationController!.isKindOfClass(ZMScrollableNavigationController) {
      let scrollableNavigationController = self.navigationController as ZMScrollableNavigationController
      scrollableNavigationController.topOffset = -Double(scrollView.contentOffset.y)
    }
  }
  
}

