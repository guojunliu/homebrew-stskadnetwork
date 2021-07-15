//
//  STSKAdNetworkItems.h
//  SKAdNetwork
//
//  Created by steve on 2021/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STSKAdNetworkIdentifier : NSObject

+ (NSMutableArray *)downLoadAdItems:(NSDictionary *)sourceDic;

+ (NSArray *)deDuplication:(NSArray *)adItems;

@end

NS_ASSUME_NONNULL_END
