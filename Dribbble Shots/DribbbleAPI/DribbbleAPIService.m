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

@implementation DribbbleAPIService

+ (void)getShots:(void (^)(NSArray *shots, NSError *error))completionHandler {
    NSArray *shots = @[
                       [[Shot alloc] initWithId:1
                                          title:@"Book iOS App Navigation"
                                          image:[[Image alloc] initWithLinkToImage:@"https://d13yacurqjgara.cloudfront.net/users/32512/screenshots/2364939/ipad_1x.png"]],
                       [[Shot alloc] initWithId:2
                                          title:@"Content Guide"
                                          image:[[Image alloc] initWithLinkToImage:@"https://d13yacurqjgara.cloudfront.net/users/37624/screenshots/2365051/content_illustrations_1x.gif"]],
                       [[Shot alloc] initWithId:3
                                          title:@"Funnybeer"
                                          image:[[Image alloc] initWithLinkToImage:@"https://d13yacurqjgara.cloudfront.net/users/220725/screenshots/2364712/funnybeer_1x.jpg"]]
                       ];
    completionHandler(shots, nil);
}

@end
