//
//  NGProjectDetailViewController.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGProjectDetailViewController.h"
#import "KVBrowserViewController.h"

@interface NGProjectDetailViewController ()

@end

@implementation NGProjectDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary*)myDict{
    
    self = [super init];
    if (self) {
        dict = myDict;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = [NSString stringWithFormat:@"PROJECT CASE: %@", dict[@"name"]];
    self.scrollView.contentSize = (CGSize){320,self.scrollView.frame.size.height};
    self.scrollView.frame = (CGRect){0,0,320,IS_4INCH?568:480};
    self.view.bounds = (CGRect){0,0,320,IS_4INCH?568:480};
    
    [self.logoImage setImage:[UIImage imageNamed:dict[@"logo"]] forState:UIControlStateNormal];
    self.logoImage.layer.cornerRadius = 15;
    self.logoImage.layer.masksToBounds = YES;
    
    self.titleApp.text = ((NSString*)dict[@"name"]).uppercaseString;
    self.payoff.text = dict[@"payoff"];
    self.description.text = dict[@"description"];
    [self.description sizeToFit];
    
    [btnClient setTitle:dict[@"client"][@"name"] forState:UIControlStateNormal];
    
    if([dict[@"client"][@"name"] isEqualToString:@""]){
        [btnClient setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    [btnStatus setTitle:dict[@"status"][@"name"] forState:UIControlStateNormal];
    
    if(![dict[@"status"][@"name"] isEqualToString:@"Available on the App Store"]){
        [btnStatus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if(![dict[@"video"] isEqualToString:@""]){
        [webView loadHTMLString:[self htmlStringForEmbeddingVideoYoutubeWithURL:dict[@"video"] andFrame:webView.frame] baseURL:nil];
    } else {
        self.scrollView.contentSize = (CGSize){320,self.scrollView.contentSize.height-webView.frame.size.height};
    }
    lblDate.text = dict[@"date"];
    lblLanguages.text = dict[@"languages"];
    lblStats.text = dict[@"stats"];
    [lblStats sizeToFit];
    
    int plus = 0;
    if([lblStats.text isEqual:@""]){
        lblDescStats.hidden = YES;
        lblStats.hidden = YES;
        plus = 30;
    }
    
    self.viewDetail.frame = (CGRect){0, self.description.frame.origin.y+self.description.frame.size.height+10, self.viewDetail.frame.size.width, self.viewDetail.frame.size.height-plus};
    webView.frame = (CGRect){webView.frame.origin.x, self.viewDetail.frame.origin.y+self.viewDetail.frame.size.height+10, webView.frame.size};
    
    mwPhotos = [NSMutableArray array];
    
    int x = 0;
    NSArray *ar = dict[@"img"];
    for(int i = 0; i < ar.count; i++){
        NSString *path = ar[i];
        UIImage *img = [UIImage imageNamed:path];
        [mwPhotos addObject:[[MWPhoto alloc] initWithImage:img]];
        int width = (img.size.width*175)/img.size.height;
        UIButton *b = [[UIButton alloc] initWithFrame:(CGRect){x+10,10,width,175}];
        [b setBackgroundImage:img forState:UIControlStateNormal];
        b.tag=i+1;
        [b addTarget:self action:@selector(openPhoto:) forControlEvents:UIControlEventTouchUpInside];
        x+=b.frame.size.width+10;
        [self.imgScroll addSubview:b];
    }
    
    self.imgScroll.contentSize = (CGSize){x+10,195};
    

}


#pragma mark - Embed Video YT

- (NSString *)htmlStringForEmbeddingVideoYoutubeWithURL:(NSString *)urlString andFrame:(CGRect)frame {
    NSString *videoID = [self extractYoutubeVideoID:urlString];
    
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"http://www.youtube.com/v/%@\" type=\"application/x-shockwave-flash\" \
    width=\"100%%\" height=\"100%%\"></embed>\
    </body></html>";
    NSString *html = [NSString stringWithFormat:embedHTML, videoID];
    
    return html;
}


- (NSString *)extractYoutubeVideoID:(NSString *)urlYoutube {
    NSString *regexString = @"(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:&error];
    NSRange rangeOfFirstMatch = [regex rangeOfFirstMatchInString:urlYoutube options:0 range:NSMakeRange(0, [urlYoutube length])];
    
    if(!NSEqualRanges(rangeOfFirstMatch, NSMakeRange(NSNotFound, 0))) {
        NSString *substringForFirstMatch = [urlYoutube substringWithRange:rangeOfFirstMatch];
        
        return substringForFirstMatch;
    }
    
    return nil;
}

-(void)openPhoto:(UIButton*)sender{
    long int tag = sender.tag-1;
    
    // Create browser
	MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.zoomPhotosToFill = YES;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    browser.wantsFullScreenLayout = YES;
#endif
    browser.enableSwipeToDismiss = YES;
    [browser setCurrentPhotoIndex:tag];
    
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nc animated:YES completion:nil];
}

#pragma MWPhotoBrowser

-(void)toggleFullscreen:(id)sender{
    
    // Create array of `MWPhoto` objects
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return mwPhotos.count;
}

- (MWPhoto *)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    return mwPhotos[index];
}


- (IBAction)openClientInfo:(id)sender {
    
    if(![dict[@"client"][@"link"] isEqualToString:@""]){
        
        KVBrowserViewController *bro = [[KVBrowserViewController alloc] initWithUrl:dict[@"client"][@"link"] ];
        [self.navigationController pushViewController:bro animated:YES];
        
    }
    
}
- (IBAction)openStatusInfo:(id)sender {
    
    if(![dict[@"status"][@"link"] isEqualToString:@""]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:dict[@"status"][@"link"]]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
