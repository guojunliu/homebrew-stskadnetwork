//
//  STNetwork.m
//  stskadnetwork
//
//  Created by steve on 2021/7/13.
//

#import "STNetwork.h"
#import "STProgressBar.h"

@interface STNetwork ()
{
    NSURLSession *_session;
}
@end

@implementation STNetwork

+ (void)HTTPGetWithUrl:(NSString *)url parameter:(NSDictionary *)parameter completion:(void (^)(id responseObject))completionBlock error:(void (^)(NSError *error))errorBlock
{
    NSMutableString *parameterStr = [[NSMutableString alloc] init];
    int i = 0;
    for (NSString *key in parameter)
    {
        if (i != 0)
        {
            [parameterStr appendString:@"&"];
        }
        NSString *value = [parameter objectForKey:key];
        [parameterStr appendFormat:@"%@=%@",key,value];
        i++;
    }
    
    if (parameterStr != nil && ![parameterStr isEqualToString:@""]) {
        NSString *encodedParameterStr = [parameterStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSString stringWithFormat:@"%@?%@",url,encodedParameterStr];
    }
    
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            errorBlock(error);
        } else {
            id responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            completionBlock(responseObject);
        }
    }];
    [dataTask resume];
}



@end
