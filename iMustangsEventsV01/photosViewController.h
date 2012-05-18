//
//  photosViewController.h
//  iMustangsEventsV01
//
//  Created by Eric Binnion on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface photosViewController : UIViewController{
    IBOutlet UIWebView *webSite;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    NSTimer *timer; 
}

@end
