//
//  NGProjectsCell.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGProjectsCell.h"

@interface NGProjectsCell ()

@end

@implementation NGProjectsCell


-(id)initWithNibName:(NSString*)Name{
	
	UIViewController *temporaryController = [[UIViewController alloc] initWithNibName:Name bundle:nil];
	self = (NGProjectsCell*)temporaryController.view;
	
	return self;
    
    
}

- (IBAction)didTouchButton:(UIButton*)sender {
    
    int idx = 0;
    if(sender==self.img1){
        idx=0;
    } else if(sender==self.img2){
        idx=1;
    } else if(sender==self.img3){
        idx=2;
    }
    
    if(self.delegate){
        [self.delegate didSelectObjectInCell:self atIndex:idx];
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}




@end
