#
#  Be sure to run `pod spec lint SegueReusableViewHelper.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "SegueReusableViewHelper"
s.summary = "A simple helper library to deal with reusable views, segue handling and instantiation through storyboard ids."
s.requires_arc = true

# 2
s.version = "1.0.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author             = { "Rodolfo Roca" => "rroca1982@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/rroca1982/SegueReusableViewHelper"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/rroca1982/SegueReusableViewHelper.git", 
             :tag => "#{s.version}" }

# 8
s.source_files = "SegueReusableViewHelper/**/*.{swift}"

# 10
s.swift_version = "4.2"

end
