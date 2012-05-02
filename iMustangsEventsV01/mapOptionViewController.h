//
//  mapOptionViewController.h
//  iMustangsEventsV01
//
//  Created by Eric Binnion on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapView.h"

@interface mapOptionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    IBOutlet UIPickerView *pickerView;
    NSArray *pickerViewArray;
    MapView *passedMapView;
}

@property (nonatomic, retain) NSArray *pickerViewArray;
@property (nonatomic, strong) MapView *passedMapView;
-(IBAction)selectedRow;

@end