//
//  NGHomeCell.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGHomeCell.h"

@interface NGHomeCell ()

@end

@implementation NGHomeCell


-(id)initWithNibName:(NSString*)Name{
	
	UIViewController *temporaryController = [[UIViewController alloc] initWithNibName:Name bundle:nil];
	self = (NGHomeCell*)temporaryController.view;
	
	return self;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
