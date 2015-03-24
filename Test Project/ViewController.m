//
//  ViewController.m
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/24/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+ZMScrollable.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  NSLog(@"ViewController viewDidLayoutSubviews %f", -self.scrollView.contentOffset.y);
  self.navigationController.topOffset = -self.scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"ViewController scrollViewDidScroll %f", -self.scrollView.contentOffset.y);
  self.navigationController.topOffset = -scrollView.contentOffset.y;
}

@end
