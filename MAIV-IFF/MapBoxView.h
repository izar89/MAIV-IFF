//
//  MapBoxView.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 24/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMMapView.h"
#import "RMMapBoxSource.h"
#import "RMTileCache.h"
#import "FileManager.h"

@interface MapBoxView : UIView

@property(strong, nonatomic)RMMapView *mapView;

@end
