//
//  DribbbleAPIClient.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DribbbleAPIClient : NSObject

- (void)getShots;
- (void)getShotsForList:(NSString *)list timeFrame:(NSString *)timeframe
                   date:(NSDate *)date sort:(NSString *)sort;


@end
