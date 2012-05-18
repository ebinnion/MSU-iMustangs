//
//  MapView.m
//  iMustangsEventsV01
//
//  Created by Jackson, Jacob on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapView.h"
#import "TileOverlay.h"
#import "TileOverlayView.h"
#import "mapOptionViewController.h"
#import "CoreLocation/CoreLocation.h"
#import "MyAnnotation.h"
#import "ActionSheetPicker.h"


@implementation MapView
@synthesize  myAnnotation1;
@synthesize myAnnotation2;
@dynamic theCoordinate1;
@dynamic theCoordinate2;

@synthesize navFromView;
@synthesize mapOptionButton;
@synthesize selectedIndex;

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

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    TileOverlayView *view = [[TileOverlayView alloc] initWithOverlay:overlay];
    view.tileAlpha = 0.6;
    return [view autorelease];
}

- (void)viewWillAppear:(BOOL)animated
{
    map.mapType = MKMapTypeSatellite;
    MKCoordinateRegion CSC;
    
    // Defines the center point of the map
    CSC.center.latitude = 33.874809;
    CSC.center.longitude = -98.521129;
    
    // Defines the view,able area of the map. Lower numbers zoom in!
    CSC.span.latitudeDelta = .003;
    CSC.span.longitudeDelta = .003;
    [map setRegion:CSC animated:YES];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    

    myAnnotation1.title=@"Wellness Center";
    myAnnotation1.subtitle=@"";
    theCoordinate1.latitude = 33.869764;
    theCoordinate1.longitude = -98.523;
    myAnnotation1.coordinate=theCoordinate1;
    
    myAnnotation2.title=@"President's House";
    myAnnotation2.subtitle=@"";  
    theCoordinate2.latitude = 33.868857;
    theCoordinate2.longitude = -98.520;           
    myAnnotation2.coordinate=theCoordinate2;
    
    [map removeAnnotation:myAnnotation1];
    [map removeAnnotation:myAnnotation2];
    
    switch (selectedIndex){
        case 0:            
            [map addAnnotation:myAnnotation1];
            break;
        case 1:
            [map addAnnotation:myAnnotation2];
            break;
        default:
            break;
    }
}

-(void)viewDidAppear:(BOOL)animated
{	    
        
              /*  
               
               MyAnnotation* myAnnotation3=[[MyAnnotation alloc] init];
               myAnnotation3.title=@"DL Ligon Coliseum";
               myAnnotation3.subtitle=@"CO";
               CLLocationCoordinate2D theCoordinate3;
               theCoordinate3.latitude = 33.871778;
               theCoordinate3.longitude = -98.51964;
               myAnnotation3.coordinate=theCoordinate3;
               
               MyAnnotation* myAnnotation4=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate4;
               theCoordinate4.latitude = 33.873905;
               theCoordinate4.longitude = -98.519468;
               myAnnotation4.title=@"Bolin Science Hall";
               myAnnotation4.subtitle=@"BO";
               myAnnotation4.coordinate=theCoordinate4;
               
               MyAnnotation* myAnnotation5=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate5;
               theCoordinate5.latitude = 33.873969;
               theCoordinate5.longitude = -98.521193;
               myAnnotation5.title=@"Prothro Yeager Hall";
               myAnnotation5.subtitle=@"PY";
               myAnnotation5.coordinate=theCoordinate5;
               
               MyAnnotation* myAnnotation6=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate6;
               theCoordinate6.latitude = 33.874773;
               theCoordinate6.longitude = -98.521131;
               myAnnotation6.title=@"Clark Student Center";
               myAnnotation6.subtitle=@"CS";
               myAnnotation6.coordinate=theCoordinate6;
               
               MyAnnotation* myAnnotation7=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate7;
               myAnnotation7.title=@"Moffett Library";
               myAnnotation7.subtitle=@"LI";
               theCoordinate7.latitude = 33.874754;
               theCoordinate7.longitude = -98.51934;
               myAnnotation7.coordinate=theCoordinate7;
               
               MyAnnotation* myAnnotation8=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate8;
               myAnnotation8.title=@"Hardin Administration Building";
               myAnnotation8.subtitle=@"HA";
               theCoordinate8.latitude = 33.876228;
               theCoordinate8.longitude = -98.519755;
               myAnnotation8.coordinate=theCoordinate8;
               
               MyAnnotation* myAnnotation9=[[MyAnnotation alloc] init];   
               CLLocationCoordinate2D theCoordinate9;
               myAnnotation9.title=@"Dillard College of Business Administration";
               myAnnotation9.subtitle=@"DB";
               theCoordinate9.latitude = 33.877033;
               theCoordinate9.longitude = -98.521228;
               myAnnotation9.coordinate=theCoordinate9;
               
               CLLocationCoordinate2D theCoordinate10;
               theCoordinate10.latitude = 33.877548;
               theCoordinate10.longitude = -98.522439;
               MyAnnotation* myAnnotation10=[[MyAnnotation alloc] init];
               myAnnotation10.coordinate=theCoordinate10;
               myAnnotation10.title=@"Bridwell Hall";
               myAnnotation10.subtitle=@"BH";
               
               CLLocationCoordinate2D theCoordinate11;
               theCoordinate11.latitude = 33.877762;
               theCoordinate11.longitude = -98.523237;
               MyAnnotation* myAnnotation11=[[MyAnnotation alloc] init];
               myAnnotation11.coordinate=theCoordinate11;
               myAnnotation11.title=@"Counseling Center";
               myAnnotation11.subtitle=@"CG";
               
               CLLocationCoordinate2D theCoordinate12;
               theCoordinate12.latitude = 33.877643;
               theCoordinate12.longitude = -98.523894;
               MyAnnotation* myAnnotation12=[[MyAnnotation alloc] init];
               myAnnotation12.coordinate=theCoordinate12;
               myAnnotation12.title=@"University Police Department";
               myAnnotation12.subtitle=@"PD";
               
               
               CLLocationCoordinate2D theCoordinate13;
               theCoordinate13.latitude = 33.877388;
               theCoordinate13.longitude = -98.523194;
               
               MyAnnotation* myAnnotation13=[[MyAnnotation alloc] init];
               
               myAnnotation13.coordinate=theCoordinate13;
               myAnnotation13.title=@"McGaha Hall";
               myAnnotation13.subtitle=@"MG";
               
               MyAnnotation* myAnnotation14=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate14;
               myAnnotation14.title=@"Bridwell Apartments";
               myAnnotation14.subtitle=@"";
               theCoordinate14.latitude = 33.87713;
               theCoordinate14.longitude = -98.524056;
               myAnnotation14.coordinate=theCoordinate14;
               
               MyAnnotation* myAnnotation15=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate15;
               myAnnotation15.title=@"Instrumental Music Hall";
               myAnnotation15.subtitle=@"IM";
               theCoordinate15.latitude = 33.876945;
               theCoordinate15.longitude = -98.52328;
               myAnnotation15.coordinate=theCoordinate15;
               
               MyAnnotation* myAnnotation16=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate16;
               theCoordinate16.latitude = 33.876014;
               theCoordinate16.longitude = -98.523234;
               myAnnotation16.coordinate=theCoordinate16;
               myAnnotation16.title=@"McCullough Hall";
               myAnnotation16.subtitle=@"MC";
               
               MyAnnotation* myAnnotation17=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate17;
               theCoordinate17.latitude = 33.875548;
               theCoordinate17.longitude = -98.52317;
               myAnnotation17.coordinate=theCoordinate17;
               myAnnotation17.title=@"Marchman Hall";
               myAnnotation17.subtitle=@"MH";
               
               MyAnnotation* myAnnotation18=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate18;
               theCoordinate18.latitude = 33.875069;
               theCoordinate18.longitude = -98.523151;
               myAnnotation18.coordinate=theCoordinate18;
               myAnnotation18.title=@"McCullough-Trigg Hall";
               myAnnotation18.subtitle=@"MT";
               
               MyAnnotation* myAnnotation19=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate19;
               theCoordinate19.latitude = 33.874878;
               theCoordinate19.longitude = -98.522346;
               myAnnotation19.coordinate=theCoordinate19;
               myAnnotation19.title=@"Killingsworth Hall";
               myAnnotation19.subtitle=@"KH";
               
               MyAnnotation* myAnnotation20=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate20;
               theCoordinate20.latitude = 33.874263;
               theCoordinate20.longitude = -98.5223;
               myAnnotation20.coordinate=theCoordinate20;
               myAnnotation20.title=@"Pierce Hall";
               myAnnotation20.subtitle=@"PH";
               
               MyAnnotation* myAnnotation21=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate21;
               theCoordinate21.latitude = 33.873685;
               theCoordinate21.longitude = -98.522432;
               myAnnotation21.coordinate=theCoordinate21;
               myAnnotation21.title=@"Fain Instrumental Music Hall";
               myAnnotation21.subtitle=@"FM";
               
               MyAnnotation* myAnnotation22=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate22;
               myAnnotation22.title=@"Fain Fine Arts Center";
               myAnnotation22.subtitle=@"FA";
               theCoordinate22.latitude = 33.873375;
               theCoordinate22.longitude = -98.522966;
               myAnnotation22.coordinate=theCoordinate22;
               
               MyAnnotation* myAnnotation25=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate25;
               myAnnotation25.title=@"Sunwatcher Village";
               myAnnotation25.subtitle=@"in the city";
               theCoordinate25.latitude = 33.875548;
               theCoordinate25.longitude = -98.52317;
               myAnnotation25.coordinate=theCoordinate25;
               
               MyAnnotation* myAnnotation26=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate26;
               myAnnotation26.title=@"Sundance Court";
               myAnnotation26.subtitle=@"on a Bridge";
               theCoordinate26.latitude = 33.871282;
               theCoordinate26.longitude = -98.524253;
               myAnnotation26.coordinate=theCoordinate26;
               
               MyAnnotation* myAnnotation27=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate27;
               myAnnotation27.title=@"Honors Program House";
               myAnnotation27.subtitle=@"in the forest";
               theCoordinate27.latitude = 33.868447;
               theCoordinate27.longitude = -98.518959;
               myAnnotation27.coordinate=theCoordinate27;
               
               MyAnnotation* myAnnotation28=[[MyAnnotation alloc] init];
               CLLocationCoordinate2D theCoordinate28;
               myAnnotation28.title=@"Sikes Lake Center";
               myAnnotation28.subtitle=@"at Russian Hill";
               theCoordinate28.latitude = 33.867539;
               theCoordinate28.longitude = -98.522236;
               myAnnotation28.coordinate=theCoordinate28;

            
            [map addAnnotation:myAnnotation4];
            [map addAnnotation:myAnnotation5];
            [map addAnnotation:myAnnotation6];
            [map addAnnotation:myAnnotation7];
            [map addAnnotation:myAnnotation8];
            [map addAnnotation:myAnnotation9];
            [map addAnnotation:myAnnotation10];
            [map addAnnotation:myAnnotation11];
            [map addAnnotation:myAnnotation12];
            [map addAnnotation:myAnnotation13];
            [map addAnnotation:myAnnotation14];
            [map addAnnotation:myAnnotation15];
            [map addAnnotation:myAnnotation16];
            [map addAnnotation:myAnnotation17];
            [map addAnnotation:myAnnotation18];
            [map addAnnotation:myAnnotation19];
            [map addAnnotation:myAnnotation20];
            [map addAnnotation:myAnnotation21];
            [map addAnnotation:myAnnotation22];
            [map addAnnotation:myAnnotation23];
            [map addAnnotation:myAnnotation24];
            [map addAnnotation:myAnnotation25];
            [map addAnnotation:myAnnotation26];
            [map addAnnotation:myAnnotation27];
            [map addAnnotation:myAnnotation28];
         */
    
    NSString *tileDirectory = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Tiles"];
    TileOverlay *overlay = [[TileOverlay alloc] initWithTileDirectory:tileDirectory];
    
    [map addOverlay:overlay];
    
}

- (void) viewDidLoad
{
    selectedIndex = 0; // default to show all annotations
}

- (void)viewDidUnload
{
    [self setMapOptionButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)mapOptionButtonPressed:(id)sender {
    mapOptionViewController *mapOptions = [[mapOptionViewController alloc] initWithNibName:@"mapOptionViewController" bundle:nil];
    mapOptions.passedMapView = self;
    mapOptions.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mapOptions animated:YES];
    
}
@end
