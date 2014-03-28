//
//  FileManager.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

+(NSArray *)getJsonFromDDWithName:(NSString *)name{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *pathString = [NSString stringWithFormat:@"%@/%@",documentsDirectory, name];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:pathString];
    if(fileExists){
        NSData *jsonData= [NSData dataWithContentsOfFile:pathString];
        NSError *error = nil;
        NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if(!error){
            //NSLog(@"[FileManager] loadedData: %@", loadedData);
            return loadedData;
        } else {
            NSLog(@"[FileManager] error: %@", error);
        }
    }
    return nil;
}

+(UIImage *)getImageFromDDWithName:(NSString *)name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *pathString = [NSString stringWithFormat:@"%@/%@",documentsDirectory, name];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:pathString];
    if(fileExists){
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        NSLog(@"[FileManager] image: %@", pathString);
        return image;
    }
    return nil;
}

+(NSString *)getStringFromPlistWithName:(NSString *)name AndKey:(NSString *)key{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    NSDictionary* plist = [NSDictionary dictionaryWithContentsOfFile:path];
    return [plist valueForKeyPath:key];
}

@end
