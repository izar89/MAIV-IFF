//
//  SoldierViewController.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoldierView.h"
#import "CameraView.h"

@interface SoldierViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

//SoldierView
@property(strong, nonatomic)SoldierView *view;

//CameraView
@property(strong, nonatomic)CameraView *cameraView;
@property(strong, nonatomic)UIImagePickerController *imagePickerController;

@end
