//
//  EventSearchView.h
//  iMustangsEventsV01
//
//  Created by Seals, Shawn on 4/10/12.
//  Copyright (c) 2012 __MSU__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventListView;

@interface EventSearchView : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *eventPicker;
    NSArray* eventType;
    NSArray* eventLocation;
    NSMutableString *navFromView;
    UIButton *showEventsButton;
}

@property (nonatomic, strong) IBOutlet UIPickerView *eventPicker;
@property (nonatomic, strong) IBOutlet UIButton *showEventsButton;
@property (nonatomic, strong) NSMutableString *navFromView;

- (IBAction)showEventsButtonPressed:(id)sender;

@end
