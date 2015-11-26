//
//  AppDelegate.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/22/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "DribbbleAPIService.h"
#import "DribbbleClientSettings.h"
#import "NXOAuth2AccountStore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    DribbbleClientSettings *settings = [[DribbbleClientSettings alloc] initWithApiEntryPoint:kDribbbleAPIEntryPoint
                                                                                 accessToken:kDribbbleAPIClientAccessToken];
    [DribbbleAPIService setSharedClientSettings:settings];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+ (void)initialize {
    [[NXOAuth2AccountStore sharedStore] setClientID:kDribbbleAPIClientID
                                             secret:kDribbbleAPIClientSecret
                                   authorizationURL:[NSURL URLWithString:kDribbbleAPIOAuth2AuthorizationURL]
                                           tokenURL:[NSURL URLWithString:kDribbbleAPIOAuth2TokenURL]
                                        redirectURL:[NSURL URLWithString:kDribbbleAPIOAuth2RedirectURL]
                                     forAccountType:kOAuthAccountType];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NXOAuth2AccountStoreAccountsDidChangeNotification
                                                      object:[NXOAuth2AccountStore sharedStore]
                                                       queue:nil
                                                  usingBlock:^(NSNotification *aNotification){
                                                      NSLog(@"%@", aNotification);
                                                      // Update your UI
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NXOAuth2AccountStoreDidFailToRequestAccessNotification
                                                      object:[NXOAuth2AccountStore sharedStore]
                                                       queue:nil
                                                  usingBlock:^(NSNotification *aNotification){
                                                      NSError *error = [aNotification.userInfo objectForKey:NXOAuth2AccountStoreErrorKey];
                                                      NSLog(@"%@", error);
                                                      // Do something with the error
                                                  }];
}

@end
