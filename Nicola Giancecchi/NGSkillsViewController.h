//
//  NGSkillsViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 12/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGSkillsViewController : UIViewController{
    
    IBOutlet UIButton *logoHUM;
    
    IBOutlet UIButton *logoPRG;
    IBOutlet UIButton *logoOTH;
    
    IBOutlet UIView *humView;
    IBOutlet UIView *prgView;
    IBOutlet UIView *othView;
}

@property(strong,nonatomic) IBOutlet UIScrollView *scrollView;
@end
