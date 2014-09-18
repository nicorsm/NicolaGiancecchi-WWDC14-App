//
//  NGProjectsViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGProjectsCell.h"
#import "UIColor+HexString.h"

@interface NGProjectsViewController : UIViewController<NGProjectsCellDelegate,UITableViewDataSource,UITableViewDelegate>{
    NSArray *projects;
    NSArray *colours;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(id)initWithArray:(NSArray*)ar;

@end
