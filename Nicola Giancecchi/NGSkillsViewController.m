//
//  NGSkillsViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 12/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGSkillsViewController.h"

@interface NGSkillsViewController ()

@end

@implementation NGSkillsViewController

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
    
    self.navigationItem.title = @"SKILLS";
    self.scrollView.contentOffset = (CGPoint){0,0};
    self.scrollView.layer.cornerRadius = 15;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.frame = (CGRect){self.scrollView.frame.origin, self.scrollView.frame.size.width, ht};
    self.view.bounds = (CGRect){0,0,320,ht};
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    humView.frame = (CGRect){0,0,humView.frame.size};
    prgView.frame = (CGRect){0,humView.frame.size.height,prgView.frame.size};
    othView.frame = (CGRect){0, prgView.frame.origin.y+prgView.frame.size.height, othView.frame.size.width, 504};
    
    
    self.scrollView.contentSize = (CGSize){230,othView.frame.origin.y+504};
    
    [self.scrollView addSubview:humView];
    [self.scrollView addSubview:prgView];
    [self.scrollView addSubview:othView];
    
    logoHUM.layer.cornerRadius = 35;
    logoHUM.layer.masksToBounds = YES;
    logoHUM.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoHUM.layer.borderWidth = 1;
    
    logoPRG.layer.cornerRadius = 35;
    logoPRG.layer.masksToBounds = YES;
    logoPRG.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoPRG.layer.borderWidth = 1;
    
    logoOTH.layer.cornerRadius = 35;
    logoOTH.layer.masksToBounds = YES;
    logoOTH.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoOTH.layer.borderWidth = 1;
}

- (IBAction)goToSection:(UIButton *)sender {
    
    int heigth = 0;
    switch(sender.tag){
        case 1: heigth = 0; break;
        case 2: heigth = humView.frame.size.height; break;
        case 3: heigth = prgView.frame.origin.y+prgView.frame.size.height; break;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = (CGPoint){0,heigth};
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
