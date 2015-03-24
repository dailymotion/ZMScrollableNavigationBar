//
//  ViewController.swift
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/23/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController!.topOffset = -scrollView.contentOffset.y
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    self.navigationController!.topOffset = -scrollView.contentOffset.y
  }
  
}