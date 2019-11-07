#
# Be sure to run `pod lib lint YHDTestModel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YHDTestModel'
  s.version          = '0.2.0'
  s.summary          = '非常好用的pickView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/YuHuXie/YHDTestModle.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yh' => 'yuhuxie22952sina.com' }
  s.source           = { :git => 'https://github.com/YuHuXie/YHDTestModle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YHDTestModel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YHDTestModel' => ['YHDTestModel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'pod 'Masonry', '~> 0.6.4'
   s.dependency 'Masonry', '~> 0.6.4'
end
