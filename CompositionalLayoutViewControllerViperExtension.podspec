#
# Be sure to run `pod lib lint CompositionalLayoutViewControllerViperExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CompositionalLayoutViewControllerViperExtension'
  s.version          = '0.1.0'
  s.summary          = 'Extensions for CompositionalLayoutViewController with VIPER'
  s.swift_versions   = '5.5'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Some extensions for CompositionalLayoutViewController with VIPER.
                       DESC

  s.homepage         = 'https://github.com/0x0c/CompositionalLayoutViewControllerViperExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Akira' => 'akira.matsuda@me.com' }
  s.source           = { :git => 'https://github.com/0x0c/CompositionalLayoutViewControllerViperExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/*'
  
  # s.resource_bundles = {
  #   'CompositionalLayoutViewControllerViperExtension' => ['CompositionalLayoutViewControllerViperExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Combine'
  s.dependency 'CompositionalLayoutViewController', '>= 0.1.0'
end

