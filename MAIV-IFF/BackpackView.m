//
//  BackpackView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "BackpackView.h"

@implementation BackpackView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        
        self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 205, 205)];
        self.photoView.center = CGPointMake(150, 255);
        [self addSubview:self.photoView];
        
        UIImage *backpackImage = [UIImage imageNamed:@"backpack"];
        UIImageView *backpackImageView = [[UIImageView alloc] initWithImage:backpackImage];
        [self addSubview:backpackImageView];
        
        UIImage *headerImage = [UIImage imageNamed:@"header"];
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        [self addSubview:headerImageView];
        
        UIFont *customFont = [UIFont fontWithName:@"EgyptienneFLTStd-Roman" size:22];
        self.txtCaptain = [[UITextView alloc] initWithFrame:CGRectMake(290, 180, 415, 125)];
        self.txtCaptain.textColor = [UIColor colorWithRed:99/255.0f green:91/255.0f blue:80/255.0f alpha:1];
        self.txtCaptain.font = customFont;
        self.txtCaptain.userInteractionEnabled = NO;
        self.txtCaptain.backgroundColor = [UIColor clearColor];
        self.txtCaptain.text = @"...";
        [self addSubview:self.txtCaptain];
        
        self.btnDeselect = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnDeselect.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.btnDeselect];
        
        UIImage *btnNextImage = [UIImage imageNamed:@"btnNext"];
        self.btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnNext setBackgroundImage:btnNextImage forState:UIControlStateNormal];
        self.btnNext.frame = CGRectMake(0, 0, btnNextImage.size.width, btnNextImage.size.height);
        self.btnNext.center = CGPointMake((self.frame.size.width / 2), 950);
        [self addSubview:self.btnNext];
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
