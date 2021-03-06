//
//  EventListTable.h
//  iMustangsEventsV01
//
//  Created by Seals, Shawn on 2/10/12.
//  Copyright (c) 2012 __MSU__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EventListTable : UITableViewController <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *resultsController_;
    NSMutableString *navFromView;
    NSString *eventTypeFilter;
    NSString *eventLocationFilter;
}

@property (nonatomic, readonly) NSFetchedResultsController *resultsController;
@property (nonatomic, strong) NSMutableString *navFromView;
@property (nonatomic, strong) NSString *eventTypeFilter;
@property (nonatomic, strong) NSString *eventLocationFilter;

@end
