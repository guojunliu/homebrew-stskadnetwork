//
//  STFile.m
//  stskadnetwork
//
//  Created by steve on 2021/7/13.
//

#import "STFile.h"
#import "STProgressBar.h"
#import "STPrintfDefine.h"

@implementation STFile

+ (instancetype)shareInstance {
    static STFile *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(manager == nil) {
            manager = [[STFile alloc] init];
        }
    });
    return manager;
}

+ (NSArray *)download:(NSString *)url name:(NSString *)name path:(NSString *)path error:(NSError **)error {
    if (url == nil || [url isEqualToString:@""]) {
        *error = [NSError errorWithDomain:@"STFile" code:0 userInfo:nil];
        return nil;
    }
    
    [STProgressBar start];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url] options:NSDataReadingUncached error:error];
    [STProgressBar completion];
    if (*error) {
        return nil;
    }
    id responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
    if (*error) {
        return nil;
    }
    
    NSArray *array;
    if ([responseObject isKindOfClass:[NSDictionary class]] || [responseObject isKindOfClass:[NSMutableDictionary class]]) {
        if ([[responseObject allKeys] containsObject:@"skadnetwork_ids"]) {
            array = [responseObject objectForKey:@"skadnetwork_ids"];
        }
    }
    else if ([responseObject isKindOfClass:[NSArray class]] || [responseObject isKindOfClass:[NSMutableArray class]]) {
        array = (NSArray *)responseObject;
    }
    else {
        *error = [NSError errorWithDomain:@"STFile" code:0 userInfo:nil];
        return nil;
    }
    
    NSArray *idItems = [array valueForKeyPath:@"skadnetwork_id"];
    return idItems;
}

+ (NSDictionary *)getJsonPathDic {

    NSString *sourcePath = @"";
//    sourcePath = @"https://raw.githubusercontent.com/guojunliu/stskadnetwork/master/json/source.json";  // 老地址
    sourcePath = @"https://raw.githubusercontent.com/guojunliu/homebrew-stskadnetwork/master/json/source.json"; // 新地址。更新时最好两份地址都更新一下
//    sourcePath = @"https://steve_liu.coding.net/p/homebrew-stskadnetwork-source/d/homebrew-stskadnetwork-source/git/raw/master/json/source.json";
    if ([STFile shareInstance].sourceFilePath != nil && ![[STFile shareInstance].sourceFilePath isEqualToString:@""]) {
        sourcePath = [STFile shareInstance].sourceFilePath;
    }
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:sourcePath] options:NSDataReadingUncached error:&error];
    if (error) {
        printf(RED"[ERROR] source error: %s\n"NONE, error.localizedDescription.UTF8String);
        return nil;
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        printf(RED"[ERROR] source error: %s\n"NONE, error.localizedDescription.UTF8String);
        return nil;
    }
    
    NSDictionary *sourceDic;
    if ([[dic allKeys] containsObject:@"source"]) {
        sourceDic = [dic objectForKey:@"source"];
    }
    
    if (sourceDic == nil) {
        printf(RED"[ERROR] source json is nil\n"NONE);
    }
    
    return sourceDic;
}

@end
