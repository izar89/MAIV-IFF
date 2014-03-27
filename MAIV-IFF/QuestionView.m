//
//  QuestionView.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 27/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "QuestionView.h"

@implementation QuestionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //UI
        UIImage *headerImage = [UIImage imageNamed:@"header"];
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        [self addSubview:headerImageView];
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
