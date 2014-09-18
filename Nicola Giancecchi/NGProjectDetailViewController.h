//
//  NGProjectDetailViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWPhotoBrowser.h"
#import "MWPhoto.h"

@interface NGProjectDetailViewController : UIViewController<MWPhotoBrowserDelegate>{
    NSDictionary *dict;
    IBOutlet UIButton *btnClient;
    IBOutlet UIButton *btnStatus;
    IBOutlet UILabel *lblDate;
    IBOutlet UILabel *lblLanguages;
    IBOutlet UILabel *lblStats;
    IBOutlet UIWebView *webView;
    IBOutlet UILabel *lblDescStats;
    NSMutableArray *mwPhotos;
}

@property (strong, nonatomic) IBOutlet UIScrollView *imgScroll;
@property (strong, nonatomic) IBOutlet UIButton *logoImage;
@property (strong, nonatomic) IBOutlet UILabel *titleApp;
@property (strong, nonatomic) IBOutlet UILabel *payoff;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UIView *viewDetail;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


-(id)initWithDictionary:(NSDictionary*)myDict;




@end
