//
//  PlacesViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "PlacesViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@interface PlacesViewController ()

@end

@implementation PlacesViewController {
    GMSMapView *mapView_;
    
    CLLocationManager *locationManager;
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
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    
    [locationManager startUpdatingLocation];
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    
    CLLocationCoordinate2D coord;
    coord.longitude = location.coordinate.longitude;
    coord.latitude = location.coordinate.latitude;
//    lat = coord.latitude;
//    longt = coord.longitude;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:coord.latitude
                                                            longitude:coord.longitude
                                                                 zoom:13];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    
    [locationManager stopUpdatingLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
