//
//  STManager.h
//  stskadnetwork
//
//  Created by steve on 2021/7/15.
//

#import <Foundation/Foundation.h>

@interface STManager : NSObject

+ (void)exportToInfoPlist;

+ (void)exportToNewPlist:(NSString *)path;

+ (void)exportToString:(NSString *)path;

@end
