//
//  LoginController.m
//  Dribbble Shots
//
//  Created by IEvgen Verkush on 11/26/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "LoginController.h"
#import "NXOAuth2AccountStore.h"
#import "Constants.h"
#import "NSError+ShowWarning.h"


@interface LoginController() <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation LoginController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    __weak typeof(self) wSelf = self;
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:kOAuthAccountType
                                   withPreparedAuthorizationURLHandler:^(NSURL *preparedURL){
                                       [wSelf.webView loadRequest:[NSURLRequest requestWithURL:preparedURL]];
                                   }];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSRange range = [self.webView.request.URL.absoluteString rangeOfString:kDribbbleAPIOAuth2RedirectURL
                                                                   options:NSCaseInsensitiveSearch];
    if (range.location != NSNotFound) {
        NSURL *url = [NSURL URLWithString:self.webView.request.URL.absoluteString];
        [[NXOAuth2AccountStore sharedStore] handleRedirectURL:url];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [error showWarningInController:self];
}

@end
