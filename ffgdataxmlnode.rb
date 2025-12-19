class Ffgdataxmlnode < Formula
  desc "Google's GDataXMLNode library for XML data processing"
  homepage "https://github.com/Harris1121/FFGDataXMLNode"
  head "https://github.com/Harris1121/FFGDataXMLNode.git", branch: "master"
  license "MIT"

  depends_on "libxml2"

  def install
    # Install the header file
    include.install "GDataXMLNodeDemo/GDataXMLNode/GDataXMLNode.h"
    
    # Install the source file (for users who want to compile it themselves)
    (include/"GDataXMLNode").install "GDataXMLNodeDemo/GDataXMLNode/GDataXMLNode.m"
    
    # Create a pkgconfig file for easy integration
    (lib/"pkgconfig").mkpath
    File.write lib/"pkgconfig/ffgdataxmlnode.pc", <<~EOS
      prefix=#{prefix}
      includedir=${prefix}/include
      
      Name: FFGDataXMLNode
      Description: Google's GDataXMLNode library for XML data processing
      Version: #{version}
      Cflags: -I${includedir}
      Libs: -lxml2
    EOS
  end

  test do
    (testpath/"test.m").write <<~EOS
      #import <GDataXMLNode.h>
      #import <Foundation/Foundation.h>

      int main() {
        @autoreleasepool {
          NSString *xmlString = @"<root><element>Test</element></root>";
          NSError *error = nil;
          GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xmlString 
                                                                       options:0 
                                                                         error:&error];
          if (doc) {
            return 0;
          }
          return 1;
        }
      }
    EOS
    
    system ENV.cc, "test.m", "-o", "test", "-framework", "Foundation",
           "-I#{include}", "-lxml2", "-I#{MacOS.sdk_path}/usr/include/libxml2"
  end
end
