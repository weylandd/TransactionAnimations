Pod::Spec.new do |s|
  s.name             = "TransactionAnimations"
  s.version          = "0.2.0"
  s.summary          = "Custom transaction animations."

  s.homepage         = "https://github.com/weylandd/TransactionAnimations"
  s.license          = 'MIT'
  s.author           = { "Alex Kopachev" => "jioruh2011@ya.ru" }
  s.source           = { :git => "https://github.com/weylandd/TransactionAnimations.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.{h,m}'
  s.resource_bundles = {
    'TransactionAnimations' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'Foundation', 'UIKit'
end
