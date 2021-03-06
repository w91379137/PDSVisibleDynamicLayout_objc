Pod::Spec.new do |s|
    s.name     = 'PDSVisibleDynamicLayout_objc'
    s.version  = '0.0.4'
    s.summary  = 'Description of your projectx'
    s.license  = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author   = {
        'w91379137' => 'w91379137'
    }
    s.homepage = 'https://github.com/w91379137/PDSVisibleDynamicLayout_objc'

    s.source   = {
        :git => 'https://github.com/w91379137/PDSVisibleDynamicLayout_objc.git',
        :tag => s.version.to_s
    }
    s.source_files = 'PDSVisibleDynamicLayout_objcDemo/PDSVisibleDynamicLayout_objc/*{.h,.c,.m,.rtf}'
    s.requires_arc = true

    s.platform = :ios
    s.ios.deployment_target = '8.0'
end
