# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'SMNEApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SMNEApp

pod 'Firebase/Core'
pod 'Firebase/Crashlytics'
pod 'Firebase/Analytics'
pod 'Firebase/Auth'
pod 'GoogleSignIn'
pod 'Firebase/Firestore'
pod 'lottie-ios'
pod 'IQKeyboardManagerSwift'

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
  end
 end
end

  target 'SMNEAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SMNEAppUITests' do
    # Pods for testing
  end

end
