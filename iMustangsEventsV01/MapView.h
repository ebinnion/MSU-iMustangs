//
//  MapView.h
//  iMustangsEventsV01
//
//  Created by Jackson, Jacob on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapView.h"
#import "TileOverlay.h"
#import "TileOverlayView.h"
#import "mapOptionViewController.h"
#import "CoreLocation/CoreLocation.h"
#import "MyAnnotation.h"
#import "ActionSheetPicker.h"

@interface MapView : UIViewController <MKMapViewDelegate> {
    IBOutlet MKMapView *map;
    NSMutableString *navFromView;
    NSInteger selectedIndex;
}

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSMutableString *navFromView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *mapOptionButton;
- (IBAction)mapOptionButtonPressed:(id)sender;



@end
