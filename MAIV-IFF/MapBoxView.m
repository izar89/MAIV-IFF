//
//  MapBoxView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 24/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "MapBoxView.h"

@implementation MapBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"stijnheylen.hk12j1bl"];
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.8798, 2.9003) zoomLevel:15 maxZoomLevel:20 minZoomLevel:8 backgroundImage:nil];
        [self addSubview:self.mapView];
    }
    return self;
}

-(void)updateWithRoutecoords:(NSArray *)routecoords{
    [self.mapView addAnnotations:routecoords];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
