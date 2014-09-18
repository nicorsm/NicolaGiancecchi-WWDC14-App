//
//  NGAwardsViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 10/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGAwardsViewController : UIViewController{
    IBOutlet UIButton *logoNINE;
    IBOutlet UIButton *logoMERI;
    IBOutlet UIButton *logoAVIS;
    IBOutlet UIButton *logoCONF;
    
    IBOutlet UIView *nineView;
    IBOutlet UIView *meriView;
    IBOutlet UIView *avisView;
    IBOutlet UIView *confView;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
