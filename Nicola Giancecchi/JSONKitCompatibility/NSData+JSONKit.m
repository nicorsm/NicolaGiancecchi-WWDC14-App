//
//  NSData+JSONKit.m
//  Incontri
//
//  Created by Samuele Mazza on 25/11/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import "NSData+JSONKit.h"

@implementation NSData (JSONKit)

-(id)objectFromJSONData{

	return  [NSJSONSerialization
			 JSONObjectWithData:self
			 options:kNilOptions
			 error:nil];
}

@end
