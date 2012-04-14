//
//  mapOptionViewController.m
//  iMustangsEventsV01
//
//  Created by Eric Binnion on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "mapOptionViewController.h"
#import "MapView.h"

@interface mapOptionViewController ()

@end

@implementation mapOptionViewController
@synthesize pickerViewArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [pickerViewArray count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.pickerViewArray objectAtIndex:row];
}

-(IBAction)selectedRow {
    int selectedIndex = [pickerView selectedRowInComponent:0];
    NSLog(@"Selected Index = %i" ,selectedIndex );
} 

- (void)viewDidLoad
{
    NSArray *arrayToLoadPicker = [[NSArray alloc] initWithObjects:@"All",@"Bolin", nil];
    self.pickerViewArray = arrayToLoadPicker;
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
