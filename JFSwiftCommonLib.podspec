#
# Be sure to run `pod lib lint JFSwiftCommonLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JFSwiftCommonLib"
  s.version          = "0.1.3"
  s.summary          = "jf-swift-commonlib is my common lib for swift"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                      This lib will increase by more swift libs. If it suitable for your porject ,welcome you to include it to your project.If you have some questions you can send me email to ascode@msn.cn for help. 
                       DESC

  s.homepage         = "https://github.com/ascode/JFSwiftCommonLib.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "金飞" => "ascode@msn.cn" }
  s.source           = { :git => "https://github.com/ascode/JFSwiftCommonLib.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JFSwiftCommonLib' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
