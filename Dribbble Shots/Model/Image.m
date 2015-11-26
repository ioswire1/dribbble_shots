//
//  Image.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "Image.h"

@implementation Image

- (instancetype)initWithLinkToImage:(NSString *)linkToImage {
    self = [super init];
    if (self) {
        _hidpi = linkToImage;
        _normal = linkToImage;
        _teaser = linkToImage;
    }
    return self;
}

@end
