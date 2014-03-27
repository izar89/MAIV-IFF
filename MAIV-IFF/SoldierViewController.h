//
//  SoldierViewController.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoldierView.h"
#import "BackpackViewController.h"

@interface SoldierViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(strong, nonatomic)SoldierView *view;
@property(strong, nonatomic)UIImagePickerController *imagePickerController;

@end
