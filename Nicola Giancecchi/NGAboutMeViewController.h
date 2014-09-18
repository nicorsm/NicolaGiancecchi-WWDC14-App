//
//  NGAboutMeViewController.h
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>


@interface NGAboutMeViewController : UIViewController<MFMailComposeViewControllerDelegate>{
    
    IBOutlet UIButton *logoRSM;
    
    IBOutlet UIButton *logoNIC;
    IBOutlet UIButton *logoCON;
    
    IBOutlet UIView *nicView;
    IBOutlet UIView *conView;
    IBOutlet UIView *rsmView;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
