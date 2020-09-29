Pod::Spec.new do |spec|

    spec.name         = "TTSDK"
    spec.version      = "1.1.0.4"
    spec.summary      = "A comprehensive multimedia SDK."
    spec.description  = <<-DESC
      A comprehensive multimedia SDK which provides live streaming, VOD and the other related abilities.
                     DESC
  
    spec.homepage     = "https://github.com/volcengine/TTSDK-iOS"
  
    spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  
    spec.author       = { "chenzhaojie" => "chenzhaojie@bytedance.com" }
    spec.platform     = :ios, "8.0"
  
    spec.source       = { :http => "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/TTSDK/#{spec.version}/TTSDK.zip" }
    
    spec.default_subspecs = 'Core', 'TTFFmpeg', 'PlayerCore', 'LivePull', 'LivePush', 'Player', 'Image'
  
    spec.subspec 'Core' do |subspec|
      subspec.public_header_files = [
        'TTSDK/VCloudPandora/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/VCloudPandora/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_Core_ios.a',
        'TTSDK/TTVideoSetting/**/*.a',
      ]
      subspec.dependency 'RangersAppLog', '>= 3.2.5'
      subspec.libraries = 'stdc++'
    end

    spec.subspec 'TTFFmpegFramework' do |subspec|
      subspec.vendored_frameworks = [
        'TTSDK/TTFFmpegFramework/TTFFmpegFramework.framework'
      ]
      subspec.vendored_libraries = [
        'TTSDK/boringssl/**/*.a',
      ]
      subspec.frameworks = [
        'CoreMotion',
        'CoreMedia',
        'MetalKit',
        'OpenAL',
        'VideoToolBox',
        'AudioToolBox',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec 'TTFFmpeg' do |subspec|
      subspec.vendored_libraries = [
        'TTSDK/boringssl/**/*.a',
        'TTSDK/TTFFmpeg/**/*.a',
        'TTSDK/lib_h_dec/**/*.a',
      ]
      subspec.frameworks = [
        'CoreMotion',
        'CoreMedia',
        'MetalKit',
        'OpenAL',
        'VideoToolBox',
        'AudioToolBox',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end

    spec.subspec 'PlayerCore' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.source_files = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/*.h',
        'TTSDK/TTPlayerSDK/TTPlayerSDK/TTPlayer/TTAVPlayerLoadControlInterface.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTPlayerSDK/**/*.a',
        'TTSDK/audiosdk/**/*.a',
      ]
      subspec.resources = [
        'TTSDK/TTPlayerSDK/TTPlayerSDK/Assets/ttplayer.metallib',
      ]
      subspec.frameworks = [
        'CoreMotion',
        'CoreMedia',
        'MetalKit',
        'OpenAL',
        'VideoToolBox',
        'AudioToolBox',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.libraries = 'stdc++', 'z', 'xml2', 'iconv'
    end
  
    spec.subspec 'LivePull' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTVideoLive/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTVideoLive/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoLive/**/*.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePull_ios.a',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore'
      subspec.dependency 'CocoaAsyncSocket', '~> 7.6.4'
    end
  
    spec.subspec 'LivePush' do |subspec|
      subspec.public_header_files = [
        'TTSDK/LiveStreamFramework/prj/ios/LiveStreamFramework/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/LiveStreamFramework/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/LiveStreamFramework/**/*.a',
        'TTSDK/VCloudPandora/ios-arch-iphone/libVCloudPandora_LivePush_ios.a',
      ]
      subspec.frameworks = [
        'VideoToolBox',
        'AudioToolBox',
        'CoreMotion',
        'CoreMedia',
        'AVFoundation',
        'SystemConfiguration',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.libraries = 'stdc++'
    end
  
    spec.subspec 'Player' do |subspec|
      subspec.public_header_files = [
        'TTSDK/TTVideoEngine/**/*.h',
        'TTSDK/VCPreloadStrategy/**/*.h',
        'TTSDK/TTNetworkPredict/**/*.h',
        'TTSDK/ABRInterface/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/TTVideoEngine/**/*',
        'TTSDK/VCPreloadStrategy/**/*',
        'TTSDK/TTNetworkPredict/**/*',
        'TTSDK/ABRInterface/**/*',
      ]
      subspec.exclude_files = [
        'TTSDK/TTVideoEngine/TTVideoEngine/Classes/License/TTLicenseManager.h',
      ]
      subspec.vendored_libraries = [
        'TTSDK/TTVideoEngine/**/*.a',
        'TTSDK/TTTopSignature/**/*.a',
        'TTSDK/MDLMediaDataLoader/**/*.a',
        'TTSDK/VCPreloadStrategy/**/*.a',
        'TTSDK/VCNVCloudNetwork/**/*.a',
        'TTSDK/TTNetworkPredict/**/*.a',
        'TTSDK/ABRInterface/**/*.a',
      ]
      subspec.dependency 'TTSDK/Core'
      subspec.dependency 'TTSDK/PlayerCore'
    end

    spec.subspec 'Image' do |subspec|
      subspec.public_header_files = [
        'TTSDK/BDWebImageToB/**/*.h',
      ]
      subspec.source_files = [
        'TTSDK/BDWebImageToB/**/*',
      ]
      subspec.vendored_libraries = [
        'TTSDK/BDWebImageToB/**/*.a'
      ]
      subspec.dependency 'libwebp'
    end

  end
  
