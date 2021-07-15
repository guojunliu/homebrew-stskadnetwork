//
//  STExport.m
//  stskadnetwork
//
//  Created by steve on 2021/7/15.
//

#import "STExport.h"
#import "STPrintfDefine.h"

@implementation STExport

NSString *itemsKey = @"SKAdNetworkItems";
NSString *idKey = @"SKAdNetworkIdentifier";

+ (NSString *)currentPath {
    char strpwd[301];
    memset(strpwd,0,sizeof(strpwd));
    getcwd(strpwd,300);
    NSString *path = [[NSString alloc] initWithCString:strpwd encoding:NSUTF8StringEncoding];
    return path;
}

+ (BOOL)haveInfoPlist {
    NSString *workPath = [self currentPath];
    NSString *infoPlistPath = [NSString stringWithFormat:@"%@/Info.plist",workPath];
    BOOL isDirectory;
    BOOL haveInfoPlist = [[NSFileManager defaultManager] fileExistsAtPath:infoPlistPath isDirectory:&isDirectory];
    if (!haveInfoPlist || isDirectory) {
        return NO;
    }
    return YES;
}

+ (NSString *)getCurrentPlistPath {
    // 准备导出 导出路径
    NSString *workPath = [self currentPath];
    NSString *infoPlistPath = [NSString stringWithFormat:@"%@/Info.plist",workPath];
    return infoPlistPath;
}

+ (void)exportToInfoPlist:(NSArray *)idItems {
    
    // 导出
    printfG("\n\n▶️  开始导出");
    printfDivider();
    
    NSString *infoPlistPath = [self getCurrentPlistPath];
    if (![self haveInfoPlist]) {
        printf(RED"\n[ERROR] %s 不存在\n"NONE,infoPlistPath.UTF8String);
        return;
    }
    
    NSURL *infoPlistPathUrl = [NSURL fileURLWithPath:infoPlistPath];
    NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfURL:infoPlistPathUrl];
    NSArray *infoItemArray = [[NSArray alloc] init];
    if (infoDic && [[infoDic allKeys] containsObject:itemsKey]) {
        infoItemArray = [infoDic objectForKey:itemsKey];
    }
    
    NSMutableArray *infoIdArray = [[NSMutableArray alloc] init];
    if (infoItemArray && infoItemArray.count > 0) {
        for (int i = 0; i < infoItemArray.count; i++) {
            NSDictionary *dic = [infoItemArray objectAtIndex:i];
            if (dic && [[dic allKeys] containsObject:idKey]) {
                NSString *value = [dic objectForKey:idKey];
                [infoIdArray addObject:value];
            }
        }
    }
    
    printf("\n%-73s%8i个", "Info.plist中原有", (int)infoIdArray.count);
    printf("\n%-75s%8i个", "本次共下载", (int)idItems.count);
    
    
    NSArray *addingItems = [infoIdArray arrayByAddingObjectsFromArray:idItems];
    NSArray *allItems = [addingItems valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
    NSMutableArray *newItemsArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < allItems.count; i++) {
        NSString *value = [allItems objectAtIndex:i];
        if (value == nil) {
            value = @"";
        }
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:value, idKey, nil];
        [newItemsArr addObject:dic];
    }
    
    [infoDic setValue:newItemsArr forKey:itemsKey];
    [infoDic writeToURL:[NSURL fileURLWithPath:infoPlistPath] atomically:YES];

    printfDivider();
    printf(GREEN"\n%-76s%8i个"NONE, "去重后共导出", (int)allItems.count);
    printfG("\n✅ 导出结束\n");
}

+ (void)exportToNewPlist:(NSArray *)idItems path:(NSString *)path {
    
    printfG("\n\n▶️  开始导出");
    printfDivider();
    
    if (path == nil || [path isEqualToString:@""]) {
        path = [self currentPath];
    }
    
    BOOL havePath = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (!havePath) {
        printf(RED"\n[ERROR] %s 不存在\n"NONE,path.UTF8String);
        return;
    }
    
    NSString *infoFilePath = [path stringByAppendingPathComponent:@"Info_copy.plist"];
    
    NSMutableArray *newItemsArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < idItems.count; i++) {
        NSString *value = [idItems objectAtIndex:i];
        if (value == nil) {
            value = @"";
        }
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:value, idKey, nil];
        [newItemsArr addObject:dic];
    }
    
    NSMutableDictionary *infoDic = [[NSMutableDictionary alloc] init];
    [infoDic setValue:newItemsArr forKey:itemsKey];
    [infoDic writeToURL:[NSURL fileURLWithPath:infoFilePath] atomically:YES];
    
    
    printf(GREEN"\nPlist导出路径为 %s"NONE, infoFilePath.UTF8String);
    printfDivider();
    printfG("\n✅ 导出结束\n");
}

+ (void)exportToString:(NSArray *)idItems path:(NSString *)path  {
    
    printfG("\n\n▶️  开始导出");
    printfDivider();
    
    if (path == nil || [path isEqualToString:@""]) {
        path = [self currentPath];
    }
    
    BOOL havePath = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (!havePath) {
        printf(RED"[ERROR] %s 不存在\n"NONE,path.UTF8String);
        return;
    }
    
    NSString *txtFilePath = [path stringByAppendingPathComponent:@"SKAdNetworkIdentifier.txt"];
    
    // 导出txt
    NSMutableString *text = [[NSMutableString alloc] init];
    for (int i = 0; i<idItems.count; i++) {
        NSString *adid = [idItems objectAtIndex:i];
        [text appendString:@"\""];
        [text appendString:adid];
        [text appendString:@"\""];
        if (i != idItems.count-1) {
            [text appendString:@",\n"];
        }
    }
    
    NSError *error;
    [text writeToURL:[NSURL fileURLWithPath:txtFilePath] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    printf(GREEN"\nPlist导出路径为 %s"NONE, txtFilePath.UTF8String);
    printfDivider();
    printfG("\n✅ 导出结束\n");
}

@end
