//
//  UINavigationController+ZMScrollable.m
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/23/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

#import "UINavigationController+ZMScrollable.h"

static const CGFloat maxTopOffset = 0.0;

@implementation UINavigationController (ZMScrollable)

- (CGFloat)minTopOffset {
  return - CGRectGetHeight(self.navigationBar.frame);
}

- (void)setTopOffset:(CGFloat)newTopOffset {
  if (self.navigationBarHidden) {
    // Nothing to do if the UINavigationBar is hidden
    return;
  }
  if (([[[UIDevice currentDevice] systemVersion] compare:@"8.0.0" options:NSNumericSearch] == NSOrderedAscending)) {
    // iOS < 8.0.0 not supported at the time
    return;
  }
  
  CGFloat topOffset = newTopOffset;
  
  // Adjust to the presence of a UIStatusBar
  if (![UIApplication sharedApplication].statusBarHidden) {
    topOffset -= CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
  }
  
  // Adjust so that the view doesn't scroll below the UINavigationBar before it starts hiding
  topOffset -= CGRectGetHeight(self.navigationBar.frame);
  
  topOffset = MIN(MAX(topOffset, [self minTopOffset]), maxTopOffset);
  
  if (topOffset != self.topOffset) {
    CGRect frame = self.view.frame;
    frame.origin.y = topOffset;
    frame.size.height = CGRectGetHeight(self.view.superview.frame) - topOffset;
    self.view.frame = frame;
    
    // Create a Blur View and apply it on top of the UINavigationBar
    UIView *view = [self.view viewWithTag:101010];
    if (!view) {
      if (self.navigationBar.barTintColor) {
        view = [[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor = self.navigationBar.barTintColor;
        view.tag = 101010;
        [self.view addSubview:view];
      } else {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        visualEffectView.tag = 101010;
        [self.view addSubview:visualEffectView];
        view = visualEffectView;
      }
    }
    
    CGRect viewFrame = self.navigationBar.frame;
    if (![UIApplication sharedApplication].statusBarHidden) {
      viewFrame.origin.y -= CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
      viewFrame.size.height += CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    }
    view.frame = viewFrame;
    view.alpha = fabs(topOffset/self.minTopOffset);
  }
}

- (CGFloat)topOffset {
  return CGRectGetMinY(self.view.frame);
}

- (void)resetTopOffset {
  CGFloat defaultTopOffset = CGRectGetHeight(self.navigationBar.frame);
  
  // Adjust to the presence of a UIStatusBar
  if (![UIApplication sharedApplication].statusBarHidden) {
    defaultTopOffset += CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
  }
  
  self.topOffset = defaultTopOffset;
}

@end
