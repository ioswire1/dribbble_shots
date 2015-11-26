//
//  Shot.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractModel.h"
#import "Image.h"
#import "User.h"

@interface Shot : AbstractModel

@property (nonatomic) NSInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@property (nonatomic, strong) Image *image;
@property (nonatomic) BOOL animated;
@property (nonatomic, strong) User *user;

//Please do not rely to this method we added this method only in the very begining for creating stubs
- (instancetype)initWithId:(NSInteger)id title:(NSString *)title image:(Image *)image NS_DEPRECATED_IOS(9_0, 9_0);

@end
