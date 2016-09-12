//
//  MapViewController.m
//  WorldTrotter
//
//  Created by Austins Work on 9/12/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()
@property (nonatomic) MKMapView *mapView;
@end

@implementation MapViewController

-(void)loadView{
    //create a map view
    self.mapView = [MKMapView new];
    
    //Set it as *the* view of the controller
    self.view = self.mapView;
    
    //Add a segmented control to the view
    NSArray *segItems = @[@"Standard",@"Hybrid",@"Satallite"];
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:segItems];
    segControl.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    segControl.selectedSegmentIndex = 0;
    
    segControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:segControl];
    
    [segControl addTarget:self action:@selector(mapTypeChanged:) forControlEvents:UIControlEventValueChanged];
    
    //create and add auto-layout constraints
    NSLayoutConstraint *topConstraint = [segControl.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:8];
    UILayoutGuide *margins = self.view.layoutMarginsGuide;
    NSLayoutConstraint *leadingConstraint = [segControl.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor];
    NSLayoutConstraint *trailingConstraint = [segControl.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor];
    
    //explicitly activating constraints
    topConstraint.active = YES;
    leadingConstraint.active = YES;
    trailingConstraint.active = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ConversionViewController loaded its view");
}

-(void)mapTypeChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        default:
            break;
    }
}



@end
