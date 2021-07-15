//
//  STFile.h
//  stskadnetwork
//
//  Created by steve on 2021/7/13.
//

#import <Foundation/Foundation.h>

@interface STFile : NSObject

+ (NSArray *)download:(NSString *)url name:(NSString *)name path:(NSString *)path error:(NSError **)error;

+ (NSDictionary *)getJsonPathDic;

@end
