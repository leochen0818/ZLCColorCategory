# ZLCColorCategory

**ZLCColorCategory** is a simple category of UIColor, It can make UIColor with hex string.

## How To Use

##### Objective-C

Pull `UIColor+ZLCColorCategory.h` and `UIColor+ZLCColorCategory.m` into your **Objective-C** project.  

And than just import the header file as follow:

```objective-c
#import "UIColor+ZLCColorCategory.h"
```

Make UIColor with hex string as follow:

```objective-c
UIColor color = [UIColor colorWithHexString:@"#4267b2"];
```  
  
Make UIColor of transparency with hex string as follow:

```objective-c
UIColor color = [UIColor colorWithHexString:@"#4267b2" Alpha:0.8];
```  
  
##### Swift

Pull `ZLCColorCategory.swift` into your **Swift** project.  

And than just make UIColor with hex string as follow:

```swift
let color:UIColor = UIColor.colorWithHexString("#4267b2")
```
  
Make UIColor of transparency with hex string as follow:

```swift
let color:UIColor = UIColor.colorWithHexString("#4267b2", alpha:0.8)
```
