#
# Be sure to run `pod lib lint ZMScrollableNavigationBar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZMScrollableNavigationBar"
  s.version          = "0.1.0"
  s.summary          = "A UINavigationController subclass that allows the UINavigationBar to scroll with the content (iOS 8 only)."
  s.description      = <<-DESC
                       A UINavigationController subclass that allows the UINavigationBar to scroll with the content (iOS 8 only).
                       DESC
  s.homepage         = "https://github.com/Zedenem/ZMScrollableNavigationBar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Zouhair Mahieddine" => "zouhair.mahieddine@gmail.com" }
  s.source           = { :git => "https://github.com/Zedenem/ZMScrollableNavigationBar.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/Zedenem'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = './*.swift'
  # s.resource_bundles = {'ZMScrollableNavigationBar' => ['Pod/Assets/*.png']}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
