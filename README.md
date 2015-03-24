# ZMScrollableNavigationBar
A UINavigationController subclass that allows the UINavigationBar to scroll with the content (iOS 8 only)

## Installation

###With CocoaPods

Just add pod 'ZMScrollableNavigationBar', '~> 0.1.0' to your Podfile and run

```
$> pod install
```

###Without CocoaPods

Just drag'n'drop `ZMScrollableNavigationController.swift` into your XCode project.

## Usage

Using a `UIScrollView` in your `UIViewController`, you can simply hook up the scroll to the `UINavigationBar` animation. Here is the simplest **Swift** class to do this:

```
class ViewController: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  // Update the topOffset when the view appears
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController!.topOffset = -scrollView.contentOffset.y
  }
  
  // Update the topOffset when the scrollView scrolls
  func scrollViewDidScroll(scrollView: UIScrollView) {
    self.navigationController!.topOffset = -scrollView.contentOffset.y
  }
  
}
```

## TODO

- Handle Rotation
- Show `UINavigationBar` again when user quickly swipes up