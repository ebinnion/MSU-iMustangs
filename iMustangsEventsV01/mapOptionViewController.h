//
//  mapOptionViewController.h
//  iMustangsEventsV01
//
//  Created by Eric Binnion on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mapOptionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    IBOutlet UIPickerView *pickerView;
    NSArray *pickerViewArray;
}

@property (nonatomic, retain) NSArray *pickerViewArray;
-(IBAction)selectedRow;

@end