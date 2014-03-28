//
//  FileManager.h
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

+(NSArray *)getJsonFromDDWithName:(NSString *)name;
+(UIImage *)getImageFromDDWithName:(NSString *)name;
+(NSString *)getStringFromPlistWithName:(NSString *)name AndKey:(NSString *)key;

@end
