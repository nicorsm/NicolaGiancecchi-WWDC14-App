//
//  NGStudyViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGStudyViewController : UIViewController{
    
    IBOutlet UIButton *logoITI;
    
    IBOutlet UIButton *logoSSS;
    IBOutlet UIButton *logoUNI;
    IBOutlet UIButton *logoOTH;
    
    IBOutlet UIView *sssView;
    IBOutlet UIView *uniView;
    IBOutlet UIView *itiView;
    IBOutlet UIView *otherView;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
