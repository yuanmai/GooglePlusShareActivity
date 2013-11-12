Pod::Spec.new do |s|
  s.name         = 'GooglePlusShareActivity'
  s.version      = '0.1.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = 'An UIActivity subclass for Sharing on Google+'
  s.homepage     = 'http://github.com/lysannschlegel/GooglePlusShareActivity'
  s.authors      = { 'Lysann Schlegel' => 'http://github.com/lysannschlegel' }
  s.source       = { :git => 'https://github.com/lysannschlegel/GooglePlusShareActivity' }

  s.source_files = 'GooglePlusShareActivity/*.{h,m}'
  s.resources    = 'GooglePlusShareActivity/*.png'
  s.requires_arc = true
  s.platform     = :ios, '6.0'

  s.dependency 'google-plus-ios-sdk', '1.4.1' # XXX must use this very version to know the framework search path below :(
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/google-plus-ios-sdk/google-plus-ios-sdk-1.4.1"' }
end
