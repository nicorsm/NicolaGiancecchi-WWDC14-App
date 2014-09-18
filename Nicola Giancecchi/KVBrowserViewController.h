//
//  KVBrowserViewController.h
//  KuoVadis
//
//  Created by Nico on 09/10/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVBrowserViewController : UIViewController<UIWebViewDelegate>{
    NSURLRequest *urlRequest;
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;

- (id)initWithUrl:(NSString*)url;

@end
