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
    }
    return self;
}

- (NSMutableDictionary *)imagesCollection {
    if (!_imagesCollection) {
        _imagesCollection = [@{} mutableCopy];
    }
    return _imagesCollection;
}

- (void)customMapping:(NSDictionary *)data {
    if ([data valueForKey:@"images"]) {
        id imagesData = [data valueForKey:@"images"];
        if ([imagesData isKindOfClass:[NSDictionary class]]) {
            self.imagesCollection = [imagesData mutableCopy];
        }
    }
}



@end
