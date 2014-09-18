//
//  NGAboutMeViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGAboutMeViewController.h"
#import "KVBrowserViewController.h"

@interface NGAboutMeViewController ()

@end

@implementation NGAboutMeViewController

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
    
    self.navigationItem.title = @"ABOUT ME";
    self.scrollView.contentSize = (CGSize){230,ht*3};
    self.scrollView.contentOffset = (CGPoint){0,0};
    self.scrollView.layer.cornerRadius = 15;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.frame = (CGRect){self.scrollView.frame.origin, self.scrollView.frame.size.width, ht};
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    nicView.frame = (CGRect){0,0,nicView.frame.size};
    conView.frame = (CGRect){0,nicView.frame.size.height,conView.frame.size};
    rsmView.frame = (CGRect){0,conView.frame.size.height+conView.frame.origin.y,rsmView.frame.size.width,504};
    
    self.scrollView.contentSize = (CGSize){230,rsmView.frame.origin.y+504};
    
    [self.scrollView addSubview:nicView];
    [self.scrollView addSubview:conView];
    [self.scrollView addSubview:rsmView];
    
    logoRSM.layer.cornerRadius = 35;
    logoRSM.layer.masksToBounds = YES;
    logoRSM.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoRSM.layer.borderWidth = 1;
    
    logoCON.layer.cornerRadius = 35;
    logoCON.layer.masksToBounds = YES;
    logoCON.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoCON.layer.borderWidth = 1;
    
    logoNIC.layer.cornerRadius = 35;
    logoNIC.layer.masksToBounds = YES;
    logoNIC.layer.borderColor = [UIColor lightGrayColor].CGColor;
    logoNIC.layer.borderWidth = 1;
    
    CLLocationCoordinate2D coord = {.latitude= 43.9428779, .longitude= 12.4600933};
    MKCoordinateSpan span = {.latitudeDelta= 0.3, .longitudeDelta= 0.3};
    
    MKCoordinateRegion region = {coord, span};
    [self.mapView setRegion:region];
}


- (IBAction)goToSection:(UIButton *)sender {
    
    int heigth = 0;
    switch(sender.tag){
        case 1: heigth = nicView.frame.origin.y; break;
        case 2: heigth = conView.frame.origin.y; break;
        case 3: heigth = rsmView.frame.origin.y; break;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = (CGPoint){0,heigth};
    }];
}


- (IBAction)openMoreInfo:(id)sender {
    
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:@"http://www.visitsanmarino.com/on-line/en/home.html"];
    [self.navigationController pushViewController:bro animated:YES];
}


- (IBAction)openMail:(UIButton*)sender {
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        NSArray *toRecipients = [NSArray arrayWithObjects:sender.titleLabel.text, nil];
        [mailer setToRecipients:toRecipients];
        
        
        [self presentViewController:mailer animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ahia!"
                                                        message:@"Mail not setted."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openSocial:(UIButton *)sender {
    
    KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:sender.titleLabel.text];
    [self.navigationController pushViewController:bro animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
