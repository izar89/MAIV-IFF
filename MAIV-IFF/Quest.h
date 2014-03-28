//
//  Quest.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quest : NSObject

@property(nonatomic)int identifier;
@property(strong, nonatomic)NSString *question;
@property(strong, nonatomic)NSString *response;
@property(nonatomic)int backpackItem_identifier;
@property(strong, nonatomic)NSString *location;

+ (Quest *)createQuestFromDictionary:(NSDictionary *)dictionary;

@end
