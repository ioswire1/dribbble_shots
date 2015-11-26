//
//  DribbbleClientSettings.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "DribbbleClientSettings.h"

@interface DribbbleClientSettings()

@property (nonatomic, strong) NSString *apiEntryPoint;
@property (nonatomic, strong) NSString *accessToken;

@end

@implementation DribbbleClientSettings

- (instancetype)initWithApiEntryPoint:(NSString *)url accessToken:(NSString *)accessToken {
    self = [super init];
    if (self) {
        self.apiEntryPoint = url;
        self.accessToken = accessToken;
    }
    return self;
}

@end
