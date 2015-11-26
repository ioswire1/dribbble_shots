//
//  DribbbleAPIService.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DribbbleAPIService : NSObject

+ (void)getShots:(void (^)(NSArray *shots, NSError *error))completionHandler;

@end
