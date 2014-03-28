//
//  Quest.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "Quest.h"

@implementation Quest

+ (Quest *)createQuestFromDictionary:(NSDictionary *)dictionary {
    
    Quest *quest = [[Quest alloc] init];
    quest.identifier = [[dictionary objectForKey:@"id"] intValue];
    quest.question = [dictionary objectForKey:@"question"];
    quest.response = [dictionary objectForKey:@"response"];
    quest.backpackItem_identifier = [[dictionary objectForKey:@"backpackItem_id"] intValue];
    quest.location = [dictionary objectForKey:@"location"];
    return quest;
}

@end
