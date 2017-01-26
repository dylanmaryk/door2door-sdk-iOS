
Pod::Spec.new do |s|

  s.name             = 'D2DEventCollectionKit'
  s.version          = '0.1.1'
  s.summary          = 'D2DEventCollectionKit'
  s.description      = <<-DESC
    	 					A dependency free iOS SDK for using the Door2Door mobility analytics.
                       DESC
  s.homepage         = 'www.door2door.io'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elmar Tampe' => 'elmar@door2door.io' }
  s.source           = { :git => 'https://github.com/door2door-io/door2door-sdk-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'D2DEventCollectionKit/Source/**/*'

end