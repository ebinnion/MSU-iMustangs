//
//  CustomTermSearch.h
//  iMustangsEventsV01
//
//  Created by Seals, Shawn on 4/20/12.
//  Copyright (c) 2012 __MSU__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTermSearch : UIViewController {
    UITextField *searchTermField;
    NSString *eventTypeFilter;
    NSString *eventLocationFilter;
    NSMutableString *navFromView;
}

@property (nonatomic, strong) IBOutlet UITextField *searchTermField;
@property (nonatomic, strong) NSString *eventTypeFilter;
@property (nonatomic, strong) NSString *eventLocationFilter;
@property (nonatomic, strong) NSMutableString *navFromView;

- (IBAction)searchButtonPressed:(id)sender;

@end
