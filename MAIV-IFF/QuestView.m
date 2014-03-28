//
//  QuestView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "QuestView.h"

@implementation QuestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        
        self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 205, 205)];
        self.photoView.center = CGPointMake(135, 205);
        [self addSubview:self.photoView];
        
        UIImage *backpackImage = [UIImage imageNamed:@"quest"];
        UIImageView *backpackImageView = [[UIImageView alloc] initWithImage:backpackImage];
        [self addSubview:backpackImageView];
        
        UIImage *headerImage = [UIImage imageNamed:@"header"];
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        [self addSubview:headerImageView];
        
        UIFont *customFont = [UIFont fontWithName:@"EgyptienneFLTStd-Roman" size:22];
        self.txtGeneral = [[UITextView alloc] initWithFrame:CGRectMake(265, 132, 435, 230)];
        self.txtGeneral.textColor = [UIColor colorWithRed:99/255.0f green:91/255.0f blue:80/255.0f alpha:1];
        self.txtGeneral.font = customFont;
        self.txtGeneral.userInteractionEnabled = NO;
        self.txtGeneral.backgroundColor = [UIColor clearColor];
        [self addSubview:self.txtGeneral];
        
        UIFont *customFont2 = [UIFont fontWithName:@"CalcitePro-Regular" size:31];
        self.txtBackpackInfo = [[UITextView alloc] initWithFrame:CGRectMake(60, 410, 350, 80)];
        self.txtBackpackInfo.textColor = [UIColor colorWithRed:243/255.0f green:239/255.0f blue:234/255.0f alpha:1];
        self.txtBackpackInfo.font = customFont2;
        self.txtBackpackInfo.userInteractionEnabled = NO;
        self.txtBackpackInfo.backgroundColor = [UIColor clearColor];
        [self addSubview:self.txtBackpackInfo];
        
        UIImage *btnBackImage = [UIImage imageNamed:@"btnBack"];
        self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnBack setBackgroundImage:btnBackImage forState:UIControlStateNormal];
        self.btnBack.frame = CGRectMake(0, 0, btnBackImage.size.width, btnBackImage.size.height);
        self.btnBack.center = CGPointMake((self.frame.size.width / 2), 300);
        self.btnBack.hidden = YES;
        [self addSubview:self.btnBack];
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
