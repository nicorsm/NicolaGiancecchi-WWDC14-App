//
//  NSString+JSONKit.m
//  Incontri
//
//  Created by Samuele Mazza on 25/11/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import "NSString+JSONKit.h"
#import "NSData+JSONKit.h"

@implementation NSString (JSONKit)

-(id)objectFromJSONString{
	return  [[self dataUsingEncoding:NSUTF8StringEncoding] objectFromJSONData];
}

@end
