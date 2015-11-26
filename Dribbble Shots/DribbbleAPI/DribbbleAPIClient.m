//
//  DribbbleAPIClient.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "DribbbleAPIClient.h"

typedef void (^CompletionHandler)(NSData *data, NSURLResponse *response, NSError *error);

@interface DribbbleAPIClient()

@property (nonatomic, strong) DribbbleClientSettings *settings;

@end

@implementation DribbbleAPIClient

- (instancetype)initWithSettings:(DribbbleClientSettings *)settings {
    self = [super init];
    if (self) {
        self.settings = settings;
    }
    return self;
}

- (void)getShots:(CompletionHandler)completion {
    NSURL *url = [NSURL URLWithString:self.settings.apiEntryPoint];
    url = [NSURL URLWithString:@"shots" relativeToURL:url];
    [self getURL:url urlParams:@{@"access_token": self.settings.accessToken} completionHandler:completion];
}

- (void)getURL:(NSURL *)url urlParams:(NSDictionary *)urlParams completionHandler:(CompletionHandler)completionHandler {
    NSMutableArray *urlParamsArray = [NSMutableArray arrayWithCapacity:[urlParams count]];
    for (NSString *key in urlParams) {
        [urlParamsArray addObject:[NSString stringWithFormat:@"%@=%@", key, urlParams[key]]];
    }
    NSString *queryString = [urlParamsArray componentsJoinedByString:@"&"];
    NSString *encodedQueryString =
    [queryString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    url = [NSURL URLWithString:[NSString stringWithFormat:@"?%@", encodedQueryString] relativeToURL:url];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:completionHandler];
    
    [task resume];
}

@end
