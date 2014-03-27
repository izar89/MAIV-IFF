//
//  StartViewController.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

#import "StartView.h"
#import "SoldierViewController.h"

@interface StartViewController : UIViewController<RMTileCacheBackgroundDelegate>

@property(strong, nonatomic)StartView *view;

@end
