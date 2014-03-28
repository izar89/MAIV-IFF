//
//  MapViewController.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapBoxView.h"
#import "QuestViewController.h"
#import "CoreLocation/CoreLocation.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate>

@property(strong, nonatomic)MapBoxView *view;
@property (retain) CLLocationManager* locationManager;
@property (retain) MapViewController* MapViewController;
@property (retain) MapBoxView* MapView;

@end
