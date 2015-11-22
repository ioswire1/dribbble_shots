//
//  Shot.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "Shot.h"

@implementation Shot

- (instancetype)initWithId:(NSInteger)id title:(NSString *)title image:(Image *)image {
    self = [super init];
    if (self) {
        _id = id;
        _title = title;
        _image = image;
    }
    return self;
}

@end
