//
//  NGHomeViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGHomeViewController.h"
#import "NGHomeCell.h"
#import "JSONKitCompatibility.h"
#import "NGStudyViewController.h"
#import "NGWorkViewController.h"
#import "NGProjectsViewController.h"
#import "NGAboutMeViewController.h"
#import "NGAwardsViewController.h"
#import "NGSkillsViewController.h"
#import "UIColor+HexString.h"
#import "UIScrollView+APParallaxHeader.h"

@interface NGHomeViewController (){
    NSArray *allProjects;
}

@end

@implementation NGHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.tableView.tableHeaderView = self.topView;
    
    [self.tableView addParallaxWithView:self.topView andHeight:self.topView.frame.size.height];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"json"];
    NSString *str = [NSString stringWithContentsOfFile:file
                                               encoding:NSUTF8StringEncoding error:NULL];
    
    motherArray = [str objectFromJSONString];
    
    
    NSString *filep = [[NSBundle mainBundle] pathForResource:@"projects" ofType:@"json"];
    NSString *strp = [NSString stringWithContentsOfFile:filep
                                               encoding:NSUTF8StringEncoding error:NULL];
    allProjects = [strp objectFromJSONString];
    
    
    self.navigationItem.title = @"NICOLA GIANCECCHI'S APP";
}



#pragma mark - Table view methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return motherArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = motherArray[indexPath.row];
    
    if([dict[@"link"] isEqual:@"study"]){
        NGStudyViewController *study = [[NGStudyViewController alloc] init];
        [self.navigationController pushViewController:study animated:YES];
    }
    
    if([dict[@"link"] isEqual:@"work"]){
        NGWorkViewController *work = [[NGWorkViewController alloc] init];
        [self.navigationController pushViewController:work animated:YES];
    }
    
    if([dict[@"link"] isEqual:@"projects"]){
        NGProjectsViewController *prj = [[NGProjectsViewController alloc] initWithArray:allProjects];
        [self.navigationController pushViewController:prj animated:YES];
    }
    
    if([dict[@"link"] isEqual:@"about"]){
        NGAboutMeViewController *about = [[NGAboutMeViewController alloc] init];
        [self.navigationController pushViewController:about animated:YES];
    }
    
    if([dict[@"link"] isEqual:@"awards"]){
        NGAwardsViewController *awards = [[NGAwardsViewController alloc] init];
        [self.navigationController pushViewController:awards animated:YES];
    }
    
    if([dict[@"link"] isEqual:@"skills"]){
        NGSkillsViewController *skills = [[NGSkillsViewController alloc] init];
        [self.navigationController pushViewController:skills animated:YES];
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellIdentifier";
    
    NGHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NGHomeCell alloc] initWithNibName:@"NGHomeCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *dict = motherArray[indexPath.row];
    cell.title.text = ((NSString*)dict[@"title"]).uppercaseString;
    cell.subtitle.text = (NSString*)dict[@"subtitle"];
    if([dict[@"link"] isEqual:@"projects"]){
        cell.subtitle.text = [NSString stringWithFormat:@"%lu projects", (unsigned long)allProjects.count];
    }
    cell.image.image = [UIImage imageNamed:dict[@"img"]];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = nil;
    
    cell.bgView.backgroundColor = [UIColor colorWithHexString:dict[@"color"]];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
