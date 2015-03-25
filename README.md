[![Version](https://img.shields.io/cocoapods/v/ZMScrollableNavigationBar.svg?style=flat)](http://cocoapods.org/pods/ZMScrollableNavigationBar)
[![License](https://img.shields.io/cocoapods/l/ZMScrollableNavigationBar.svg?style=flat)](http://cocoapods.org/pods/ZMScrollableNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/ZMScrollableNavigationBar.svg?style=flat)](http://cocoapods.org/pods/ZMScrollableNavigationBar)

# ZMScrollableNavigationBar
A UINavigationController subclass that allows the UINavigationBar to scroll with the content (iOS 8 only)

## Installation

###With CocoaPods

Just add `pod 'ZMScrollableNavigationBar', '~> 0.7.0'` to your Podfile and run

```
$> pod install
```

###Without CocoaPods

Just drag'n'drop `ZMScrollableNavigationController.swift` into your XCode project.

## Usage

Using a `UIScrollView` in your `UIViewController`, you can simply hook up the scroll to the `UINavigationBar` animation. Here are the two methods you need to implement:

```
- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.navigationController.topOffset = -self.scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  self.navigationController.topOffset = -scrollView.contentOffset.y;
}
```

## TODO

- Handle Rotation
- Show `UINavigationBar` again when user quickly swipes up