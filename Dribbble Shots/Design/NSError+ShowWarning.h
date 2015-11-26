//
//  NSError+ShowWarning.h
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/26/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSError (ShowWarning)

- (void)showWarningInController:(UIViewController *)controller;

@end
