Pod::Spec.new do |s|
s.name = "Onekit_Test"
s.version ="1.0"
s.summary = "Tools for ios"
s.homepage = "https://github.com/BiggerJax/Onekit_Test"
s.license = "MIT"
s.author ={"Jenny Yuan" => "yuanjiegogo@163.com"}
s.platform =iOS,"8.0"
s.source ={git =>"https://github.com/BiggerJax/Onekit_Test.git",tag =>s.version}
s.source_files = "Onekit_Test/*/.(h.m)" //这里是项目路径要传的文件

// 若需要依赖其他开源的第三方库 可以写成下列形式 若需要有多个就复制下面代码 添加第三方库
    s.dependency "AFNetWorking"
    s.dependency "GDataXML"
    s.dependency "SSZipArchive"
    s.dependency "TFhpple-master"
// 如果需要配置依赖系统库
// s.framework = 'SomeFramework'// 设置依赖的系统库名称
// s.frameworks = 'SomeFramework', 'AnotherFramework'//设置多个系统库名称
// 需要依赖系统的library
s.library = 'iconv'// 设置只依赖一个系统的library
s.libraries = 'iconv', 'xml2' // 设置依赖多个系统的library
// 这里是工程配置，这样使用者就不需要手动处理，由pod自动处理了
s.xcconfig = {'HEADER_SEARCH_PATHS' =>'$(SDKROOT)/usr/include/libxml2'}
end
