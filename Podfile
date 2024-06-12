# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

  swift_version = "5.0"
  platform :ios, '12.0'

target 'dota1x6' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for dota1x6
  pod 'RxNetworkApiClient', :inhibit_warnings => true
  pod 'RxSwift', '~> 5.0.1' # обусловлено требованиями апиклиента
  pod 'SwiftyJSON', :inhibit_warnings => true
  pod 'DITranquillity', :inhibit_warnings => true
  pod 'R.swift', :inhibit_warnings => true
  pod "DBDebugToolkit", :inhibit_warnings => true

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        config.build_settings['ARCHS[sdk=iphonesimulator*]'] =  `uname -m`
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        config.build_settings['LD_NO_PIE'] = 'NO'
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
          config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
          config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = [
                '$(FRAMEWORK_SEARCH_PATHS)'
              ]
        end
      end
    end
  end

  target 'UnitTests' do
    inherit! :complete
    pod 'R.swift'
    pod 'RxBlocking'
    pod 'RxTest'
  end

  target 'UITests' do
    inherit! :complete
    pod 'R.swift'
    pod 'RxBlocking'
    pod 'RxTest'
  end

end
