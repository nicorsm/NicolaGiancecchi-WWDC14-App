//
//  KVBrowserViewController.m
//  KuoVadis
//
//  Created by Nico on 09/10/13.
//  Copyright (c) 2013 Mr. APPs s.r.l. All rights reserved.
//

#import "KVBrowserViewController.h"

@interface KVBrowserViewController ()
{
	NSString *urlToOpen;
}
@end

@implementation KVBrowserViewController

- (id)initWithUrl:(NSString*)url
{
    self = [super initWithNibName:@"KVBrowserViewController" bundle:nil];
    if (self) {
        // Custom initialization
        urlToOpen = url;
    }
    return self;
}

-(void)dealloc{
	[self.webView stopLoading];
	self.webView.delegate=nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.webView.delegate = self;
    
    NSURL *websiteUrl;
    
    if([urlToOpen rangeOfString:@"http://"].location==NSNotFound && [urlToOpen rangeOfString:@"https://"].location==NSNotFound){
        websiteUrl=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",urlToOpen]];
    }else{
        websiteUrl = [NSURL URLWithString:urlToOpen];
    }
    
    urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    [self performSelector:@selector(loadRequest) withObject:nil afterDelay:0.5];
    
    
    
}

-(void)loadRequest{
    [self.webView loadRequest:urlRequest];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    self.navigationItem.title = @"Loading...";
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    self.navigationItem.title = @"Can't open the page.";

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

-(void)chiudiBrowser{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
