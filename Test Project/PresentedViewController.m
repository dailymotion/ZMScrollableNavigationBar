//
//  PresentedViewController.m
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/24/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

#import "PresentedViewController.h"
#import "UINavigationController+ZMScrollable.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (IBAction)close:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
