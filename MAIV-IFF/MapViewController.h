//
//  MapViewController.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "MapView.h"
#import "MapBoxView.h"

@interface MapViewController : UIViewController

@property(strong, nonatomic)MapView *view;
@property(strong, nonatomic)MapBoxView *mapBoxView;

@end
