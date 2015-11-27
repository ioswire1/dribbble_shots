//
//  DribbbleAPIService.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "DribbbleAPIService.h"
#import "Shot.h"
#import "Image.h"
#import "DribbbleAPIClient.h"
#import "DribbbleClientSettings.h"


@interface DribbbleAPIService()
    
+ (DribbbleAPIClient *)sharedClient;

@end


@implementation DribbbleAPIService

static DribbbleClientSettings *settings;
static DribbbleAPIClient *sharedInstance;

+ (void)setSharedClientSettings:(DribbbleClientSettings *)dribbbleClientSettings {
    settings = dribbbleClientSettings;
}

+ (void)updateSharedClientSettings:(DribbbleClientSettings *)dribbbleClientSettings {
    settings = dribbbleClientSettings;
    sharedInstance = [[DribbbleAPIClient alloc] initWithSettings:settings];
}

+ (DribbbleAPIClient *)sharedClient {
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DribbbleAPIClient alloc] initWithSettings:settings];
    });
    return sharedInstance;
}

+ (void)getShots:(void (^)(NSArray *shots, NSError *error))completionHandler {
    [[self sharedClient] getShots:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            NSError *errorJson = nil;
            NSDictionary *responseData = [self dictionaryFromData:data resultError:&errorJson];
            
            if (errorJson) {
                completionHandler(nil, error);
            } else {
                NSArray *shots = [Shot mapObjects:responseData];
                completionHandler(shots, nil);
            }
        }
    }];
}


#pragma mark Utility methods

+ (NSDictionary *)dictionaryFromData:(NSData *)data resultError:(NSError **)errorJson {
    id object = [NSJSONSerialization JSONObjectWithData:data
                                                options: NSJSONReadingMutableContainers
                                                  error: errorJson];
    NSDictionary *results = object;
    return results;
}

@end
