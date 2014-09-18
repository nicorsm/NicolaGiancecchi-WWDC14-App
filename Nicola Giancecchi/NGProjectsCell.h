//
//  NGProjectsCell.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NGProjectsCellDelegate<NSObject>
-(void)didSelectObjectInCell:(UITableViewCell*)cell atIndex:(int)index;
@end
@interface NGProjectsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *img1;
@property (strong, nonatomic) IBOutlet UIButton *img2;
@property (strong, nonatomic) IBOutlet UIButton *img3;
@property (strong, nonatomic) IBOutlet UILabel *lbl1;
@property (strong, nonatomic) IBOutlet UILabel *lbl2;
@property (strong, nonatomic) IBOutlet UILabel *lbl3;
@property(nonatomic, unsafe_unretained) id<NGProjectsCellDelegate> delegate;

-(id)initWithNibName:(NSString*)Name;

@end
