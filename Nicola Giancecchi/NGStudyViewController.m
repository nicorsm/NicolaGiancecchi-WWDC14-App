//
//  NGStudyViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGStudyViewController.h"
#import "KVBrowserViewController.h"
#import "JSONKitCompatibility/JSONKitCompatibility.h"
#import "NGProjectDetailViewController.h"

@interface NGStudyViewController ()

@end

@implementation NGStudyViewController

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
    
    self.navigationItem.title = @"STUDY";
    self.scrollView.contentSize = (CGSize){230,ht*3};
    self.scrollView.contentOffset = (CGPoint){0,0};
    self.scrollView.layer.cornerRadius = 15;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.frame = (CGRect){self.scrollView.frame.origin, self.scrollView.frame.size.width, ht};
    self.view.bounds = (CGRect){0,0,320,ht};
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    uniView.frame = (CGRect){0,0,uniView.frame.size};
    itiView.frame = (CGRect){0,uniView.frame.size.height,itiView.frame.size};
    sssView.frame = (CGRect){0,itiView.frame.size.height+itiView.frame.origin.y,sssView.frame.size};
    otherView.frame = (CGRect){0,sssView.frame.origin.y+sssView.frame.size.height, otherView.frame.size.width, 504};
    
    
    self.scrollView.contentSize = (CGSize){230,otherView.frame.origin.y+504};

    [self.scrollView addSubview:uniView];
    [self.scrollView addSubview:itiView];
    [self.scrollView addSubview:sssView];
    [self.scrollView addSubview:otherView];
    
    logoUNI.layer.cornerRadius = 35;
    logoUNI.layer.masksToBounds = YES;
    logoUNI.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoUNI.layer.borderWidth = 1;
    
    logoITI.layer.cornerRadius = 35;
    logoITI.layer.masksToBounds = YES;
    logoITI.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoITI.layer.borderWidth = 1;
    
    logoSSS.layer.cornerRadius = 35;
    logoSSS.layer.masksToBounds = YES;
    logoSSS.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoSSS.layer.borderWidth = 1;
    
    logoOTH.layer.cornerRadius = 35;
    logoOTH.layer.masksToBounds = YES;
    logoOTH.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoOTH.layer.borderWidth = 1;
}


- (IBAction)goToSection:(UIButton *)sender {
    
    int heigth = 0;
    switch(sender.tag){
        case 1: heigth = uniView.frame.origin.y; break;
        case 2: heigth = itiView.frame.origin.y; break;
        case 3: heigth = sssView.frame.origin.y; break;
        case 4: heigth = otherView.frame.origin.y; break;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = (CGPoint){0,heigth};
    }];
}
- (IBAction)openUNI:(id)sender {
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:@"http://isi.polocesena.unibo.it/"];
    [self.navigationController pushViewController:bro animated:YES];
}
- (IBAction)openITI:(id)sender {
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:@"http://www.itisrn.it/"];
    [self.navigationController pushViewController:bro animated:YES];
}

- (IBAction)openOTH:(id)sender {
    
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:@"http://nicola.giancecchi.com/corsi/itisrn_0813/"];
    [self.navigationController pushViewController:bro animated:YES];
}
- (IBAction)openMyItisProject:(id)sender {
    [self openProjectNamed:@"myITIS"];
}

-(void)openProjectNamed:(NSString*)name{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"projects" ofType:@"json"];
    NSString *str = [NSString stringWithContentsOfFile:file
                                              encoding:NSUTF8StringEncoding error:NULL];
    NSArray *objs = [str objectFromJSONString];
    
    for(NSDictionary *dict in objs){
        if([dict[@"name"] isEqual:name]){
            NGProjectDetailViewController *prj = [[NGProjectDetailViewController alloc] initWithDictionary:dict];
            [self.navigationController pushViewController:prj animated:YES];
        }
    }
}
- (IBAction)openFidoProject:(id)sender {
    [self openProjectNamed:@"FiDO"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
