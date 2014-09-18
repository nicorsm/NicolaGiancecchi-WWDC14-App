//
//  UIColor+HexString.h
//  AShopApp
//
//  Created by Riccardo Fuzzi on 26/06/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (UIColor *) colorWithHexString: (NSString *) hexString;
@end
