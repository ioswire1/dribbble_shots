//
//  NSError+ShowWarning.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/26/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "NSError+ShowWarning.h"

@implementation NSError (ShowWarning)

- (void)showWarningInController:(UIViewController *)controller {
    NSString *message = [self.userInfo valueForKey:NSLocalizedDescriptionKey];
    if (!message) {
        message = self.localizedDescription;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Warning", nil)
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", nil)
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];

    
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
