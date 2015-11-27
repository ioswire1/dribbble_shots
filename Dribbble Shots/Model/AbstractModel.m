//
//  AbstractModel.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/26/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "AbstractModel.h"
#import <objc/runtime.h>

@implementation AbstractModel

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self != nil) {
        Class clazz = [self class];
        u_int count;
        
        objc_property_t* properties = class_copyPropertyList(clazz, &count);
        for (int i = 0; i < count ; i++) {
            const char* propertyNameChars = property_getName(properties[i]);
            NSString *properttyName = [NSString stringWithUTF8String:propertyNameChars];
            if ([dictionary objectForKey:properttyName]) {
                [self setValue:[dictionary valueForKey:properttyName] forKey:properttyName];
            }
        }
        free(properties);
        
        [self customMapping:dictionary];
    }
    return self;
}
    
- (void)customMapping:(NSDictionary *)data {
}

+ (NSArray *)mapObjects:(id)data {
    NSMutableArray *objs = [@[] mutableCopy];
    if ([data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in data) {
            id obj = [[self alloc] initFromDictionary:item];
            [objs addObject:obj];
        }
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        id obj = [[self alloc] initFromDictionary:data];
        [objs addObject:obj];
    }
    return objs;
}

@end
