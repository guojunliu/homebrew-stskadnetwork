//
//  STManager.m
//  stskadnetwork
//
//  Created by steve on 2021/7/15.
//

#import "STManager.h"
#import "STSKAdNetworkIdentifier.h"
#import "STExport.h"
#import "STFile.h"
#import "STPrintfDefine.h"

@implementation STManager

+ (void)exportToInfoPlist {
    
    // 准备导出 导出路径
    if (![STExport haveInfoPlist]) {
        NSString *infoPlistPath = [STExport getCurrentPlistPath];
        printf(LIGHT_RED"\n[ERROR] %s 不存在\n"NONE,infoPlistPath.UTF8String);
        return;
    }
    
    NSDictionary *sourceJson = [STFile getJsonPathDic];
    NSMutableArray *adItems = [STSKAdNetworkIdentifier downLoadAdItems:sourceJson];
    NSArray *deDuplicationadItems = [STSKAdNetworkIdentifier deDuplication:adItems];
    [STExport exportToInfoPlist:deDuplicationadItems];
}

+ (void)exportToNewPlist:(NSString *)path {
    NSDictionary *sourceJson = [STFile getJsonPathDic];
    NSMutableArray *adItems = [STSKAdNetworkIdentifier downLoadAdItems:sourceJson];
    NSArray *deDuplicationadItems = [STSKAdNetworkIdentifier deDuplication:adItems];
    [STExport exportToNewPlist:deDuplicationadItems path:path];
}

+ (void)exportToString:(NSString *)path {
    NSDictionary *sourceJson = [STFile getJsonPathDic];
    NSMutableArray *adItems = [STSKAdNetworkIdentifier downLoadAdItems:sourceJson];
    NSArray *deDuplicationadItems = [STSKAdNetworkIdentifier deDuplication:adItems];
    [STExport exportToString:deDuplicationadItems path:path];
}

// 创建json map
+ (NSMutableDictionary *)createJsonPathMap {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"" forKey:@"facebook"];
    [dic setValue:@"" forKey:@"admob"];
    [dic setValue:@"https://skan.mz.unity3d.com/v3/partner/skadnetworks.plist.json" forKey:@"unity"];
    [dic setValue:@"https://vungle.com/skadnetworkids.json" forKey:@"vungle"];
    [dic setValue:@"" forKey:@"ironsource"];
    [dic setValue:@"" forKey:@"applovin"];
    [dic setValue:@"https://a3.chartboost.com/skadnetworkids.json" forKey:@"chartboost"];
    [dic setValue:@"https://raw.githubusercontent.com/AdColony/AdColony-iOS-SDK/master/skadnetworkids.json" forKey:@"adcolony"];
    [dic setValue:@"https://www.inmobi.com/skadnetworkids.json" forKey:@"inmobi"];
    [dic setValue:@"" forKey:@"pangle"];
    [dic setValue:@"https://raw.githubusercontent.com/mopub/mopub-skadnetwork-ids/main/partners/mopub_marketplace.json" forKey:@"mopub"];
    [dic setValue:@"https://dev.mintegral.com/skadnetworkids.json" forKey:@"mintegral"];

    NSData *data=[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"jsonStr is %@",jsonStr);

    return dic;
}

@end
