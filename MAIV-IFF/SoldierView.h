//
//  SoldierView.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoldierView : UIView

@property(strong, nonatomic)UIImageView *photoView;
@property(strong, nonatomic)UIButton *btnCamera;
@property(strong, nonatomic)UIButton *btnNext;
@property(strong, nonatomic)UILabel *lblCaptain;

-(void)showNext;

@end
