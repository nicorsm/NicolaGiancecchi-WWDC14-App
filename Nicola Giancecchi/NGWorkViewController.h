//
//  NGWorkViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGWorkViewController : UIViewController<UIScrollViewDelegate>{
    
    IBOutlet UIButton *logoDT;
    IBOutlet UIButton *logoMR;
    
    IBOutlet UIView *dtView;
    IBOutlet UIView *mrView;
    
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
