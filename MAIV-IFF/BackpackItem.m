//
//  BackpackItem.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "BackpackItem.h"

@implementation BackpackItem

+ (BackpackItem *)createBackpackFromDictionary:(NSDictionary *)dictionary {
    
    BackpackItem *backpackItem = [[BackpackItem alloc] init];
    backpackItem.identifier = [[dictionary objectForKey:@"id"] intValue];
    backpackItem.title = [dictionary objectForKey:@"title"];
    backpackItem.text = [dictionary objectForKey:@"text"];
    backpackItem.xPos = [[dictionary objectForKey:@"xPos"] intValue];
    backpackItem.yPos = [[dictionary objectForKey:@"yPos"] intValue];
    backpackItem.imageName = [dictionary objectForKey:@"imageName"];
    backpackItem.imageSelectedName = [dictionary objectForKey:@"imageSelectedName"];
    backpackItem.imageDisabledName = [dictionary objectForKey:@"imageDisabledName"];

    return backpackItem;
}


@end
