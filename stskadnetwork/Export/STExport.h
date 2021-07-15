//
//  STExport.h
//  stskadnetwork
//
//  Created by steve on 2021/7/15.
//

#import <Foundation/Foundation.h>

@interface STExport : NSObject

+ (BOOL)haveInfoPlist;

+ (NSString *)getCurrentPlistPath;

+ (void)exportToInfoPlist:(NSArray *)idItems;

+ (void)exportToNewPlist:(NSArray *)idItems path:(NSString *)path;

+ (void)exportToString:(NSArray *)idItems path:(NSString *)path;

@end
