//
//  NSDictionary+JSONKit.m
//  Incontri
//
//  Created by Samuele Mazza on 25/11/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import "NSDictionary+JSONKit.h"

@implementation NSDictionary (JSONKit)

-(NSData*)JSONData{
	return [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
}

-(NSString*)JSONString{
	return [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
}

@end
