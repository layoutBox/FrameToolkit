#
#  Be sure to run `pod spec lint Taylor.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name          = "FrameToolkit"
  spec.version       = "0.0.3"
  spec.summary       = "TODO"
  #spec.description   = ""
  spec.homepage      = "https://github.com/lcdold/FrameToolkit/"
  spec.license       = "MIT license"
  spec.author        = { "Luc Dion" => "luc_dion@yahoo.com" }
  spec.source        = { :git => "https://github.com/lcdold/FrameToolkit.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.swift"
  spec.swift_version = '4.0'

  spec.ios.deployment_target  = '8.0'
  spec.ios.frameworks         = 'Foundation', 'CoreGraphics', 'UIKit'  
end
