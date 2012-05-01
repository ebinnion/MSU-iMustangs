//
//  CustomTermSearch.m
//  iMustangsEventsV01
//
//  Created by Seals, Shawn on 4/20/12.
//  Copyright (c) 2012 __MSU__. All rights reserved.
//

#import "CustomTermSearch.h"
#import "EventListTable.h"

@interface CustomTermSearch ()

@end

@implementation CustomTermSearch

@synthesize searchTermField;
@synthesize eventTypeFilter;
@synthesize eventLocationFilter;
@synthesize navFromView;


- (IBAction)searchButtonPressed:(id)sender {
    [sender resignFirstResponder];
    
    eventTypeFilter = [[NSString alloc] initWithString:searchTermField.text];
    
    EventListTable *eventsListView = [[EventListTable alloc] initWithStyle:UITableViewStylePlain];
    eventsListView.navFromView = [NSMutableString string];
    [eventsListView.navFromView setString:@"EventSearchView"];
    eventsListView.eventTypeFilter = [[NSString alloc] initWithString:eventTypeFilter];
    eventsListView.eventLocationFilter = [[NSString alloc] initWithString:eventLocationFilter];
    [self.navigationController pushViewController:eventsListView animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Custom Search";
    searchTermField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [searchTermField becomeFirstResponder];
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
