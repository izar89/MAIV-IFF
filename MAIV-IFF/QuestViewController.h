//
//  QuestViewController.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestView.h"
#import "FileManager.h"
#import "BackpackItem.h"
#import "Quest.h"

@interface QuestViewController : UIViewController

@property(strong, nonatomic)QuestView *view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andQuest:(Quest *)quest;

@end
