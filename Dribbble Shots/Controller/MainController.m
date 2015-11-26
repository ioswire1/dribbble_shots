//
//  ViewController.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "MainController.h"
#import "DribbbleAPIService.h"
#import "NSError+ShowWarning.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DribbbleAPIService getShots:^(NSArray *shots, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                [error showWarningInController:self];
            } else {
                //TODO shots are available here
                NSLog(@"%@", shots);
            }
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark User's actions

- (IBAction)showMenu:(UIBarButtonItem *)sender {
    __weak typeof(self) wSelf = self;
    UIAlertController *menuController = [UIAlertController
                                         alertControllerWithTitle:nil
                                         message:nil
                                         preferredStyle:UIAlertControllerStyleActionSheet];
    [menuController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil]];
    [menuController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Login", nil) style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [wSelf performSegueWithIdentifier:@"Show Login" sender:nil];
    }]];
    
    [self presentViewController:menuController animated:YES completion:nil];
}

@end
