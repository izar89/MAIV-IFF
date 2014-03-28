//
//  QuestView.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quest.h"
#import "FileManager.h"

@interface QuestView : UIView

@property(strong, nonatomic)UIImageView *photoView;
@property(strong, nonatomic)UITextView *txtGeneral;
@property(strong, nonatomic)UITextView *txtBackpackInfo;

@end
