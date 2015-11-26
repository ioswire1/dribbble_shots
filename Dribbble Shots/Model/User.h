//
//  User.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSInteger id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;

@end
