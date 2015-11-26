//
//  Shot.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"
#import "User.h"

@interface Shot : NSObject

@property (nonatomic) NSInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@property (nonatomic, strong) Image *image;
@property (nonatomic) BOOL animated;
@property (nonatomic, strong) User *user;

- (instancetype)initWithId:(NSInteger)id title:(NSString *)title image:(Image *)image;//Please do not rely to this method we added this method only in the very begining for creating stubs

@end
