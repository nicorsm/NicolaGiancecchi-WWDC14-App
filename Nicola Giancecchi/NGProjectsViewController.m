//
//  NGProjectsViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGProjectsViewController.h"
#import "NGProjectDetailViewController.h"
#import "JSONKitCompatibility.h"

@interface NGProjectsViewController ()

@end

@implementation NGProjectsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithArray:(NSArray*)ar{
    self = [super init];
    if(self){
        projects = ar;
        colours = @[@"#88e7fc", @"#6fd7f5", @"#56c6ee", @"#3eb6e7", @"#25a5e0", @"#0c95d9"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"PROJECTS";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return projects.count / 3 + 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellIdentifier";
    
    NGProjectsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NGProjectsCell alloc] initWithNibName:@"NGProjectsCell"];
    }
    cell.delegate = self;
    
    cell.backgroundView = nil;
    cell.backgroundColor = [UIColor clearColor];
    
    
	long int idx=indexPath.row*3;
	long int lastIdx=idx+3;
    
    cell.img1.hidden = YES;
    cell.lbl1.hidden = YES;
    cell.img2.hidden = YES;
    cell.lbl2.hidden = YES;
    cell.img3.hidden = YES;
    cell.lbl3.hidden = YES;
    
    
    cell.img1.layer.cornerRadius = 45;
    cell.img1.layer.masksToBounds = YES;
    cell.img1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.img1.layer.borderWidth = 1;
    
    cell.img2.layer.cornerRadius = 45;
    cell.img2.layer.masksToBounds = YES;
    cell.img2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.img2.layer.borderWidth = 1;
    
    cell.img3.layer.cornerRadius = 45;
    cell.img3.layer.masksToBounds = YES;
    cell.img3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.img3.layer.borderWidth = 1;
    
	if(projects.count<=lastIdx)
		lastIdx=projects.count;
    
	for (long int i=idx; i<lastIdx; i++) {
		NSDictionary* dict = projects[i];
        
		int pos=i%3;
        
		switch (pos) {
			case 0:
			{
                cell.lbl1.text = ((NSString*)dict[@"name"]).uppercaseString;
                [cell.img1 setBackgroundImage:[UIImage imageNamed:dict[@"logo"]] forState:UIControlStateNormal];
                cell.img1.hidden = NO;
                cell.lbl1.hidden = NO;
                break;
			}
			case 1:
			{
                [cell.img2 setBackgroundImage:[UIImage imageNamed:dict[@"logo"]] forState:UIControlStateNormal];
                cell.lbl2.text = ((NSString*)dict[@"name"]).uppercaseString;
                cell.img2.hidden = NO;
                cell.lbl2.hidden = NO;
                break;
			}
			case 2:
			{
                
                [cell.img3 setBackgroundImage:[UIImage imageNamed:dict[@"logo"]] forState:UIControlStateNormal];
                cell.lbl3.text = ((NSString*)dict[@"name"]).uppercaseString;
                cell.img3.hidden = NO;
                cell.lbl3.hidden = NO;
                break;
			}
			default:
				break;
		}
    }
    
    cell.backgroundColor = [UIColor colorWithHexString:colours[indexPath.row]];
    
    return cell;
}

-(void)didSelectObjectInCell:(UITableViewCell *)cell atIndex:(int)index{
    
    NSIndexPath *ip = [self.tableView indexPathForCell:cell];
    long int idx = (ip.row*3)+index;
    
    NGProjectDetailViewController *det = [[NGProjectDetailViewController alloc] initWithDictionary:projects[idx]];
    [self.navigationController pushViewController:det animated:YES];
}





@end
