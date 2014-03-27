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
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backpack.png"]];
        
        UIImage *headerImage = [UIImage imageNamed:@"header"];
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        [self addSubview:headerImageView];
        
        UIImage *btnNextImage = [UIImage imageNamed:@"btnNext2"];
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
