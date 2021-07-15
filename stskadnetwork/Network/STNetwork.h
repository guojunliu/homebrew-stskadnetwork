//
//  STNetwork.h
//  stskadnetwork
//
//  Created by steve on 2021/7/13.
//

#import <Foundation/Foundation.h>

@interface STNetwork : NSObject

+ (void)HTTPGetWithUrl:(NSString *)url parameter:(NSDictionary *)parameter completion:(void (^)(id responseObject))completionBlock error:(void (^)(NSError *error))errorBlock;

@end
