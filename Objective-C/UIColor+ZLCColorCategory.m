//
//  UIColor+ZLCColorCategory.m
//  EZColorFinder
//
//  Created by Leo on 2017/2/10.
//  Copyright © 2017年 Leo. All rights reserved.
//

#import "UIColor+ZLCColorCategory.h"

@implementation UIColor (ZLCColorCategory)

/*
 *  @brief - return a UIColor with hex string
 *
 *  @param - param_in hexString - use this string make UIColor with RGB
 *
 *  @return - return correct UIColor.
 *            But if hexString is not correctly RGB hex string, will return white color
 *
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    
    // No input or error input
    if ([hexString isEqualToString:@""] || hexString.length != 7) {
        return [UIColor whiteColor];
    }
    
    // error input
    if (![[hexString substringToIndex:1] isEqualToString:@"#"]) {
        return [UIColor whiteColor];
    }
    
    NSString *newHexString = [hexString substringFromIndex:1];
    unichar hexStr[newHexString.length];
    
    [newHexString getCharacters:hexStr];
    
    // error input
    for (int i = 0; i < newHexString.length; i ++) {
        unichar c = hexStr[i];
        if ( c < '0' || (c > '9' && c < 'A') || (c > 'F' && c < 'a') || c > 'f') {
            return [UIColor whiteColor];
        }
    }
    
    // Split string
    // Part of red
    NSUInteger loc = 0;
    NSRange range = NSMakeRange(loc, 2);
    NSString * redValueStr = [newHexString substringWithRange:range];
    
    // Part of green
    range.location += 2;
    NSString * greenValueStr = [newHexString substringWithRange:range];
    
    // Part of blue
    range.location += 2;
    NSString * blueValueStr = [newHexString substringWithRange:range];
    
    // Convert to Int with hexadecimal
    unsigned int redValue;
    NSScanner* redScanner = [NSScanner scannerWithString:redValueStr];
    [redScanner scanHexInt:&redValue];
    
    unsigned int greenValue;
    NSScanner* greenScanner = [NSScanner scannerWithString:greenValueStr];
    [greenScanner scanHexInt:&greenValue];
    
    unsigned int blueValue;
    NSScanner* blueScanner = [NSScanner scannerWithString:blueValueStr];
    [blueScanner scanHexInt:&blueValue];
    
    // Make UIColor
    UIColor * correctUIColor = [UIColor colorWithRed:redValue/255.0 green:greenValue/255.0 blue:blueValue/255.0 alpha:1.0];
    
    return correctUIColor;
}

/*
 *  @brief - return a UIColor of transparency with hex string
 *
 *  @param - param_in hexString - use this string make UIColor with RGB
 *
 *  @param - param_in alpha - value of transparency
 *
 *  @return - return correct UIColor.
 *            But if hexString is not correctly RGB hex string, will return white color
 *
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString Alpha:(CGFloat)alpha {
    
    // Make UIColor
    UIColor * color = [self colorWithHexString:hexString];
    CGColorRef colorRef = [color CGColor];
    
    size_t numComponents = CGColorGetNumberOfComponents(colorRef);
    
    UIColor * correctUIColor;
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(colorRef);
        CGFloat red = components[0];
        CGFloat green = components[1];
        CGFloat blue = components[2];
        correctUIColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        
    }
    
    return correctUIColor;
}

@end
