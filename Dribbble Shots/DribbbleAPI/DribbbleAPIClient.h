//
//  DribbbleAPIClient.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DribbbleClientSettings.h"

@interface DribbbleAPIClient : NSObject

- (instancetype)initWithSettings:(DribbbleClientSettings *)settings;

- (void)getShots:(void(^)(NSData *data, NSURLResponse *response, NSError *error))completion;

@end
