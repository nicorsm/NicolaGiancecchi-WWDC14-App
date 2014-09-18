//
//  NGWorkViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGWorkViewController.h"
#import "KVBrowserViewController.h"
#import "JSONKitCompatibility/JSONKitCompatibility.h"
#import "NGProjectsViewController.h"

@interface NGWorkViewController ()

@end

@implementation NGWorkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    int ht = IS_4INCH?504:416;
    
    self.navigationItem.title = @"WORK";
    self.scrollView.contentSize = (CGSize){230,ht*2};
    self.scrollView.contentOffset = (CGPoint){0,0};
    self.scrollView.layer.cornerRadius = 15;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.frame = (CGRect){self.scrollView.frame.origin, self.scrollView.frame.size.width, ht};
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    mrView.frame = (CGRect){0,0,mrView.frame.size};
    dtView.frame = (CGRect){0,mrView.frame.origin.y+mrView.frame.size.height, dtView.frame.size.width, 504};
    
    
    self.scrollView.contentSize = (CGSize){230,dtView.frame.origin.y+504};
    
    
    [self.scrollView addSubview:mrView];
    [self.scrollView addSubview:dtView];
    
    logoDT.layer.cornerRadius = 35;
    logoDT.layer.masksToBounds = YES;
    logoDT.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoDT.layer.borderWidth = 1;
    
    logoMR.layer.cornerRadius = 35;
    logoMR.layer.masksToBounds = YES;
    logoMR.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoMR.layer.borderWidth = 1;
}


- (IBAction)goToSection:(UIButton *)sender {
    
    int heigth = 0;
    switch(sender.tag){
        case 1: heigth = mrView.frame.origin.y; break;
        case 2: heigth = dtView.frame.origin.y; break;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = (CGPoint){0,heigth};
    }];
}

- (IBAction)openDT:(id)sender {
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:@"http://www.datatrade.sm"];
    [self.navigationController pushViewController:bro animated:YES];
}
- (IBAction)openMR:(id)sender {
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:@"http://www.mr-apps.com"];
    [self.navigationController pushViewController:bro animated:YES];
}
- (IBAction)openMrappsProject:(id)sender {
    NSString *file = [[NSBundle mainBundle] pathForResource:@"projects" ofType:@"json"];
    NSString *str = [NSString stringWithContentsOfFile:file
                                              encoding:NSUTF8StringEncoding error:NULL];
    NSArray *objs = [str objectFromJSONString];
    NSMutableArray *mrappsProject = [[NSMutableArray alloc] init];
    
    for(NSDictionary *dict in objs){
        BOOL b = ((NSString*)dict[@"isMrApps"]).boolValue;
        NSLog(@"%d",b);
        if(b){
            [mrappsProject addObject:dict];
        }
    }
    
    NGProjectsViewController *prj = [[NGProjectsViewController alloc] initWithArray:mrappsProject];
    prj.title = @"Mr. APPs Projects";
    [self.navigationController pushViewController:prj animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
