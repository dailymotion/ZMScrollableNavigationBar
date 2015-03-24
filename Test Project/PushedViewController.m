//
//  PushedViewController.m
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/24/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

#import "PushedViewController.h"
#import "UINavigationController+ZMScrollable.h"

@interface PushedViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation PushedViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.scrollView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  self.scrollView.delegate = nil;
}

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
