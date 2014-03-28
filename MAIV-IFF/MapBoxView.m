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
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        
        //UI
        self.mapView = [[RMMapView alloc] initWithFrame:self.frame];
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"stijnheylen.hkkg4ihk"];
        source.retryCount = 0;
        self.mapView.tileSource = source;
        //mapView = [[RMMapView alloc] initWithFrame:self.view.frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.8898, 2.8772) zoomLevel:16 maxZoomLevel:16 minZoomLevel:16 backgroundImage:nil];
        self.mapView = [[RMMapView alloc] initWithFrame:self.frame andTilesource:source];
        self.mapView.draggingEnabled = NO;
        self.mapView.zoom = self.mapView.minZoom = self.mapView.maxZoom = 16;
        self.mapView.centerCoordinate = CLLocationCoordinate2DMake(50.8898, 2.8772);
        [self insertSubview:self.mapView atIndex:0];
        
        UIImage *headerImage = [UIImage imageNamed:@"header"];
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        [self addSubview:headerImageView];
        
        UIImage *footerImage = [UIImage imageNamed:@"map_kaart"];
        UIImageView *footerImageView = [[UIImageView alloc] initWithImage:footerImage];
        footerImageView.center = CGPointMake((self.frame.size.width / 2), self.frame.size.height - footerImage.size.height / 2);
        [self addSubview:footerImageView];
        
        UIImage *compasImage = [UIImage imageNamed:@"map_kompas"];
        UIImageView *compasImageView = [[UIImageView alloc] initWithImage:compasImage];
        compasImageView.center = CGPointMake((self.frame.size.width - compasImage.size.width / 2), self.frame.size.height - compasImage.size.height / 2);
        [self addSubview:compasImageView];
    }
    return self;
}

//-(void)updateWithRoutecoords:(NSArray *)routecoords{
//    [self.mapView addAnnotations:routecoords];
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
