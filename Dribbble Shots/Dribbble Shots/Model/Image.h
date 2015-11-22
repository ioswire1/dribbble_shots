//
//  Image.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject

@property (nonatomic, strong) NSString *hidpi;
@property (nonatomic, strong) NSString *normal;
@property (nonatomic, strong) NSString *teaser;

- (instancetype)initWithLinkToImage:(NSString *)linkToImage; //Please do not rely to this method we added this method only in the very begining for creating stubs

@end
