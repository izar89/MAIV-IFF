//
//  BackpackItem.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BackpackItem : NSObject

@property(nonatomic)int identifier;
@property(strong, nonatomic)NSString *title;
@property(strong, nonatomic)NSString *text;
@property(nonatomic)int xPos;
@property(nonatomic)int yPos;
@property(strong, nonatomic)NSString *imageName;
@property(strong, nonatomic)NSString *imageSelectedName;
@property(strong, nonatomic)NSString *imageDisabledName;

+ (BackpackItem *)createBackpackFromDictionary:(NSDictionary *)dictionary;

@end
