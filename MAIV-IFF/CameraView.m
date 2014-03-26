//
//  CameraView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "CameraView.h"

@implementation CameraView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
        self.photoView.center = CGPointMake((self.frame.size.width / 2) - 8, 400);
        [self addSubview:self.photoView];
        
        UIImage *soldierImage = [UIImage imageNamed:@"soldier"];
        UIImageView *soldierImageView = [[UIImageView alloc] initWithImage:soldierImage];
        [self addSubview:soldierImageView];
        
        self.btnCamera = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnCamera.frame = frame;
        [self addSubview:self.btnCamera];
    }
    return self;
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
