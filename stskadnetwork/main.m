//
//  main.m
//  testTool
//
//  Created by steve on 2021/6/29.
//

#import <Foundation/Foundation.h>
#import "STManager.h"
#import "STPrintfDefine.h"
#import "BRLOptionParser.h"
#import "STFile.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSString *version = @"5.0.0";
        BOOL haveVersion = NO;

        BRLOptionParser *options = [BRLOptionParser new];
        
        [options setBanner:@"usage: %s [-p] [-x <path>] [-t <path>] [-s <source>]", argv[0]];
        [options addSeparator];
        [options addOption:"source" flag:'s' description:@"设置备用数据源" blockWithArgument:^(NSString *value) {
            [STFile shareInstance].sourceFilePath = value;
            printf("\n当前数据源为：%s", [[STFile shareInstance].sourceFilePath UTF8String]);
        }];
        [options addOption:"plist" flag:'p' description:@"将SKAdNetworkId导出到当前路径下的Info.plist" block:^{
            [STManager exportToInfoPlist];
            exit(EXIT_SUCCESS);
        }];
        [options addSeparator];
        [options addOption:"xml" flag:'x' description:@"将SKAdNetworkId以XML格式导出到当前路径" blockWithArgument:^(NSString *value) {
            [STManager exportToNewPlist:value];
            exit(EXIT_SUCCESS);
        }];
        [options addOption:"txt" flag:'t' description:@"将SKAdNetworkId以TXT格式导出到当前路径" blockWithArgument:^(NSString *value) {
            [STManager exportToString:value];
            exit(EXIT_SUCCESS);
        }];
        
        [options addSeparator];
        [options addOption:"version" flag:'v' description:@"当前版本号" value:&haveVersion];
        __weak typeof(options) weakOptions = options;
        [options addOption:"help" flag:'h' description:@"使用帮助" block:^{
            printfFlower;
            printf("\n\n%s", [[weakOptions description] UTF8String]);
            exit(EXIT_SUCCESS);
        }];

        NSError *error = nil;
        if (![options parseArgc:argc argv:argv error:&error]) {
            const char * message = error.localizedDescription.UTF8String;
            fprintf(stderr, "%s: %s\n", argv[0], message);
            exit(EXIT_FAILURE);
        }

        if (haveVersion) {
            printf(GREEN"stskadnetwork version %s\n"NONE, version.UTF8String);
        }
    }

    return EXIT_SUCCESS;
}
