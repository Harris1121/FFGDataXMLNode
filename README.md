# GDataXMLNode
Google提供的用于XML数据处理的老版本类集，迁移到Github上，提供给项目中还在用此版本的同学使用

## Installation

### CocoaPods
Add this to your Podfile:
```ruby
pod 'FFGDataXMLNode', :git => 'https://github.com/Harris1121/FFGDataXMLNode.git'
```

### Homebrew
You can install FFGDataXMLNode using Homebrew:
```bash
brew install ffgdataxmlnode.rb
```

Or install directly from the repository:
```bash
brew install https://raw.githubusercontent.com/Harris1121/FFGDataXMLNode/master/ffgdataxmlnode.rb
```

## Usage
After installation via Homebrew, include the header in your Objective-C project:
```objc
#import <GDataXMLNode.h>
```

Make sure to link against libxml2 and add the include path for libxml2 headers to your project settings.
