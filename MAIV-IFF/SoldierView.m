//
//  SoldierView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "SoldierView.h"

@implementation SoldierView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        
        UIImage *soldierPhoto = [UIImage imageNamed:@"soldierPhoto"];
        self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
        self.photoView.center = CGPointMake((self.frame.size.width / 2) - 8, 435);
        self.photoView.image = soldierPhoto;
        [self addSubview:self.photoView];
        
        UIImage *soldierImage = [UIImage imageNamed:@"soldier"];
        UIImageView *soldierImageView = [[UIImageView alloc] initWithImage:soldierImage];
        [self addSubview:soldierImageView];
        
        UIImage *btnCameraImage = [UIImage imageNamed:@"btnCamera"];
        self.btnCamera = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnCamera setBackgroundImage:btnCameraImage forState:UIControlStateNormal];
        self.btnCamera.frame = CGRectMake(600, 800, btnCameraImage.size.width, btnCameraImage.size.height);
        [self addSubview:self.btnCamera];
        
        UIImage *btnNextImage = [UIImage imageNamed:@"btnNext"];
        self.btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnNext setBackgroundImage:btnNextImage forState:UIControlStateNormal];
        self.btnNext.frame = CGRectMake(0, 0, btnNextImage.size.width, btnNextImage.size.height);
        self.btnNext.center = CGPointMake((self.frame.size.width / 2), 950);
        self.btnNext.hidden = YES;
        [self addSubview:self.btnNext];
        
        UIFont *customFont = [UIFont fontWithName:@"CalcitePro-Regular" size:24];
        self.txtGeneral = [[UITextField alloc] initWithFrame:CGRectMake(200, 818, 360, 50)];
        self.txtGeneral.textAlignment = NSTextAlignmentCenter;
        self.txtGeneral.font = customFont;
        self.txtGeneral.userInteractionEnabled = NO;
        self.txtGeneral.text = @"Dag soldaat! Hier kan je je foto trekken.";
        [self addSubview:self.txtGeneral];
        
        UIImage *headerImage = [UIImage imageNamed:@"header"];
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        [self addSubview:headerImageView];
    }
    return self;
}

-(void)showNext{
    
    self.btnNext.hidden = NO;
    self.txtGeneral.text = @"Tevreden? Druk dan op verder gaan.";
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
