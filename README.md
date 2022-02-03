For type generation:
https://app.quicktype.io

<h4>To install pods don't forget about arch:</h4>
arch -x86_64 pod install
arch -x86_64 pod update

post_install do |installer|
    installer.pods_project.targets.each do |target|
        flutter_additional_ios_build_settings(target)
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end

recreate iOS folder:
flutter create -i swift .