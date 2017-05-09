Pod::Spec.new do |s|
  s.name              = 'AMapSearch-NO-IDFA'
  s.version           = '1.4.0'
  s.summary           = 'AMapSearchKit for iOS.'
  s.description       = <<-DESC
                         AMapSearch SDK for iOS by Autonavi.
                        DESC
  s.homepage          = 'http://lbs.amap.com/api/ios-sdk/summary/'
  s.license           = { :type => 'Copyright', :text => 'Copyright © 2014 AutoNavi. All Rights Reserved.\n' }
  s.author            = 'lbs.amap.com'
  s.social_media_url  = 'http://lbsbbs.amap.com/forum.php?mod=forumdisplay&fid=38'
  s.documentation_url = 'http://lbs.amap.com/api/ios-sdk/reference/'
  
  s.ios.deployment_target = '8.0'

  s.dependencies        = { "AMapFoundation-NO-IDFA": [ "~>1.2"] }
  s.framework           = [ "SystemConfiguration", "CoreTelephony", "Security" ]
  s.libraries           = "z"
  s.xcconfig            = { "ARCHS": "$(ARCHS_STANDARD)", "LIBRARY_SEARCH_PATHS": "\"$(PODS_ROOT)/AMapFoundation-NO-IDFA/**\"" }

  s.source              = { :http => 'http://a.amap.com/lbs/static/zip/AMap_iOS_Search_Lib_v5.0.0.zip' }
  s.source_files        = "AMapSearchKit.framework/**/*.{h}"
  s.vendored_frameworks = "AMapSearchKit.framework"
  s.public_header_files = "AMapSearchKit.framework/Headers/*.h"

  s.prepare_command     = <<-EOF
  mkdir AMapSearchKit.framework/Modules
  touch AMapSearchKit.framework/Modules/module.modulemap
  cat <<-EOF > AMapSearchKit.framework/Modules/module.modulemap
  framework module AMapSearchKit {
      header "AMapCommonObj.h"
      header "AMapNearbySearchManager.h"
      header "AMapNearbyUploadInfo.h"
      header "AMapSearchAPI.h"
      header "AMapSearchError.h"
      header "AMapSearchKit.h"
      header "AMapSearchObj.h"
      header "AMapSearchVersion.h"
      export *
      link "z"
  }
  \EOF
  EOF

end