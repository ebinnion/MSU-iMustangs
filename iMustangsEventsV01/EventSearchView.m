//
//  EventSearchView.m
//  iMustangsEventsV01
//
//  Created by Seals, Shawn on 4/10/12.
//  Copyright (c) 2012 __MSU__. All rights reserved.
//

#import "EventSearchView.h"
#import "EventListTable.h"
#import "EventDetailView.h"
#import "CustomTermSearch.h"

@implementation EventSearchView

@synthesize eventPicker;
@synthesize showEventsButton;
@synthesize navFromView;

- (IBAction)showEventsButtonPressed:(id)sender {
    NSString *eventTypeSelected = [[NSString alloc] initWithString:[eventType objectAtIndex:[eventPicker selectedRowInComponent:0]]];
    NSString *eventLocationSelected = [[NSString alloc] initWithString:[eventLocation objectAtIndex:[eventPicker selectedRowInComponent:1]]];
    
    if (![eventTypeSelected isEqualToString:@"Other"]) {
        EventListTable *eventsListView = [[EventListTable alloc] initWithStyle:UITableViewStylePlain];
        eventsListView.navFromView = [NSMutableString string];
        [eventsListView.navFromView setString:@"EventSearchView"];
        eventsListView.eventTypeFilter = [[NSString alloc] initWithString:eventTypeSelected];
        eventsListView.eventLocationFilter = [[NSString alloc] initWithString:eventLocationSelected];
        [self.navigationController pushViewController:eventsListView animated:YES];
    } else {
        
        CustomTermSearch *customTermSearch = [[CustomTermSearch alloc] initWithNibName:@"CustomTermSearch" bundle:nil];
        customTermSearch.navFromView = [NSMutableString string];
        [customTermSearch.navFromView setString:@"EventSearchView"];
        customTermSearch.eventLocationFilter = [[NSString alloc] initWithString:eventLocationSelected];
        [self.navigationController pushViewController:customTermSearch animated:YES];
        
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Event Selector";
    
    eventType = [[NSArray alloc] initWithObjects:@"All", @"Basketball", @"Cross Country/Track", @"Football", @"Golf", @"Soccer", @"Softball", @"Tennis", @"Volleyball", @"Other", nil];
    
    eventLocation = [[NSArray alloc] initWithObjects:@"All", @"Home", @"Away", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Picker Datasource Protocol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [eventType count];
    }
    else {
        return [eventLocation count];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch(component) {
        case 0: return 225;
        case 1: return 75;
        default: return 150;
    }
    
    //NOT REACHED
    return 100;
}


#pragma mark -
#pragma mark Picker Delegate Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [eventType objectAtIndex:row];
    }
    else {
        return [eventLocation objectAtIndex:row];
    }
    return nil;
}

@end
