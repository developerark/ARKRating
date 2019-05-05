Pod::Spec.new do |s|
  s.name         = "ARKRating"
  s.version      = "1.1"
  s.summary      = "Rating widget for iOS"
  s.description  = "The ARKRating framework allows you to add highly customizable rating widget to your iOS apps."
  s.homepage     = "http://github.com/developerark"
  s.license      = "MIT"
  s.author             = "Aswin Raj Kharel"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/developerark/ARKRating.git", :tag => "1.1" }
  s.source_files  = "ARKRating", "ARKRating/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  s.swift_version = '5.0'
end
