//
//  DribbbleAPIService.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DribbbleClientSettings.h"

@interface DribbbleAPIService : NSObject

+ (void)setSharedClientSettings:(DribbbleClientSettings *)settings;
+ (void)getShots:(void (^)(NSArray *shots, NSError *error))completionHandler;

@end
