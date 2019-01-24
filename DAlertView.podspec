#
#  Be sure to run `pod spec lint DTableViewPlaceHolder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

    s.name         = "DAlertView"
    s.version      = "0.0.1"
    s.summary      = "DAlertView."
    s.description  = <<-DESC
                    this is AlertView.
                   DESC
    s.homepage     = "hhttps://github.com/destinyzhao/DAlertView"
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Destiny' => '346276712@qq.com' }
    s.source           = { :git => 'https://github.com/destinyzhao/DAlertView.git', :tag => s.version.to_s }
    s.ios.deployment_target = '10.0'
    s.source_files = 'DAlertView/**/*.{h,m}'

end
