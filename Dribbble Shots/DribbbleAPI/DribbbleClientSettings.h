//
//  DribbbleClientSettings.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DribbbleClientSettings : NSObject

@property (nonatomic, strong, readonly) NSString *apiEntryPoint;
@property (nonatomic, strong, readonly) NSString *accessToken;

-(instancetype)initWithApiEntryPoint:(NSString *)url accessToken:(NSString *)accessToken;

@end
