//
//  MapViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //Map
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"stijnheylen.hkkg4ihk"];
        source.retryCount = 0;
        self.view.mapView.tileSource = source;
        //mapView = [[RMMapView alloc] initWithFrame:self.view.frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.8898, 2.8772) zoomLevel:16 maxZoomLevel:16 minZoomLevel:16 backgroundImage:nil];
        self.view.mapView = [[RMMapView alloc] initWithFrame:self.view.frame andTilesource:source];
        self.view.mapView.draggingEnabled = NO;
        self.view.mapView.zoom = 16;
        self.view.mapView.centerCoordinate = CLLocationCoordinate2DMake(50.8898, 2.8772);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.view = [[MapBoxView alloc] initWithFrame:bounds];
}

@end
