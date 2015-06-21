platform :ios, '8.0'
use_frameworks!

target :TinyGrip, :exclusive => true do
    
    pod 'Typhoon', :head
    
    #pod 'Alamofire', '~> 1.2' Issues with swift 2.0
    pod 'CKUITools'
    pod 'ICLoader'
    pod 'NGAParallaxMotion'
    pod 'NSURL+QueryDictionary'
    pod 'OCLogTemplate'
    pod 'PaperFold', :git => 'https://github.com/jasperblues/PaperFold-for-iOS.git', :tag => '1.2-no-gesture-recognizers'
    
end

# Test Dependencies

target :TinyGripTests do
    pod 'Expecta', '~> 0.2.1'
    pod 'OCHamcrest'
    pod 'OCMockito'
end

inhibit_all_warnings!
