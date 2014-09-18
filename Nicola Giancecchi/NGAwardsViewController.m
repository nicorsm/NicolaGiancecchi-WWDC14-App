//
//  NGAwardsViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 10/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGAwardsViewController.h"
#import "KVBrowserViewController.h"

@interface NGAwardsViewController ()

@end

@implementation NGAwardsViewController

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
    
    self.navigationItem.title = @"AWARDS";
    self.scrollView.contentSize = (CGSize){230,ht*4};
    self.scrollView.contentOffset = (CGPoint){0,0};
    self.scrollView.layer.cornerRadius = 15;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.frame = (CGRect){self.scrollView.frame.origin, self.scrollView.frame.size.width, ht};
    self.view.bounds = (CGRect){0,0,320,ht};
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    nineView.frame = (CGRect){0,0,nineView.frame.size};
    meriView.frame = (CGRect){0,nineView.frame.size.height,meriView.frame.size};
    avisView.frame = (CGRect){0,meriView.frame.size.height+meriView.frame.origin.y,avisView.frame.size};
    confView.frame = (CGRect){0,avisView.frame.origin.y+avisView.frame.size.height, confView.frame.size.width, 504};
    
    
    self.scrollView.contentSize = (CGSize){230,confView.frame.origin.y+504};
    
    [self.scrollView addSubview:nineView];
    [self.scrollView addSubview:meriView];
    [self.scrollView addSubview:avisView];
    [self.scrollView addSubview:confView];
    
    logoNINE.layer.cornerRadius = 35;
    logoNINE.layer.masksToBounds = YES;
    logoNINE.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoNINE.layer.borderWidth = 1;
    
    logoMERI.layer.cornerRadius = 35;
    logoMERI.layer.masksToBounds = YES;
    logoMERI.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoMERI.layer.borderWidth = 1;
    
    logoAVIS.layer.cornerRadius = 35;
    logoAVIS.layer.masksToBounds = YES;
    logoAVIS.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoAVIS.layer.borderWidth = 1;
    
    logoCONF.layer.cornerRadius = 35;
    logoCONF.layer.masksToBounds = YES;
    logoCONF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoCONF.layer.borderWidth = 1;
}

- (IBAction)goToSection:(UIButton *)sender {
    
    int heigth = 0;
    switch(sender.tag){
        case 1: heigth = nineView.frame.origin.y; break;
        case 2: heigth = meriView.frame.origin.y; break;
        case 3: heigth = avisView.frame.origin.y; break;
        case 4: heigth = confView.frame.origin.y; break;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = (CGPoint){0,heigth};
    }];
}
- (IBAction)openNINE:(id)sender {
    [self openBrowserWithURL:@"http://www.libertas.sm/cont/news/san-marino-nuove-idee-nuove-imprese-soddisfazione-del-team-mr-apps-srl/86314/1.html"];
}

- (IBAction)openAVIS:(id)sender {
    [self openBrowserWithURL:@"http://nicola.giancecchi.com/filebase/works_design/AVIS_Infografica.pdf"];
}

- (IBAction)openCONF:(id)sender {
    [self openBrowserWithURL:@"http://www.altarimini.it/News50523-confindustria-rimini-premiati-i-vincitori-di-ricerca-talenti.php"];
}

- (IBAction)openMERI:(id)sender {
    [self openBrowserWithURL:@"http://www.sanmarinoworld.sm/?id=887&id_n=9117"];
}

-(void)openBrowserWithURL:(NSString*)url{
    
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:url];
    [self.navigationController pushViewController:bro animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
