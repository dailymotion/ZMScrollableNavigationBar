//
//  UINavigationController+ZMScrollable.h
//  ZMScrollableNavigationBar
//
//  Created by Zouhair Mahieddine on 3/23/15.
//  Copyright (c) 2015 Zedenem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ZMScrollable)

@property(nonatomic, assign) CGFloat topOffset;

// Resets the top offset to its original value (needed when moving from a controller using this category
// to another that is not)
- (void)resetTopOffset;

@end
