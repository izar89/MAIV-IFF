//
//  StartView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "StartView.h"

@implementation StartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"start.png"]];
        
        self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStart.frame = frame;
        [self addSubview:self.btnStart];
        
        self.mapCachingProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        self.mapCachingProgressView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
        self.mapCachingProgressView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height - self.mapCachingProgressView.frame.size.height / 2);
        self.mapCachingProgressView.progressTintColor = [UIColor colorWithRed:79/255.0f green:68/255.0f blue:47/255.0f alpha:1];
        [self addSubview:self.mapCachingProgressView];
        
//        self.jsonsProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
//        self.jsonsProgressView.center = CGPointMake(0, 100);
//        [self addSubview:self.jsonsProgressView];
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
