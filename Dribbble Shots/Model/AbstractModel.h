//
//  AbstractModel.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/26/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractModel : NSObject

- (instancetype)initFromDictionary:(NSDictionary *)dictionary;
- (void)customMapping:(NSDictionary *)data;
+ (NSArray *)mapObjects:(id)data;

@end
