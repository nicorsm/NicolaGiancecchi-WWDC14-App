//
//  NSDictionary+JSONKit.h
//  Incontri
//
//  Created by Samuele Mazza on 25/11/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONKit)

-(NSData*)JSONData;
-(NSData*)JSONString;

@end
