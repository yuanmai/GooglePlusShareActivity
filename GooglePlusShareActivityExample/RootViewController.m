//
//  RootViewController.m
//  GooglePlusShareActivityExample
//
//  Created by Lysann Schlegel on 10/6/13.
//  Copyright (c) 2013 Lysann Schlegel. All rights reserved.
//

#import "RootViewController.h"

#import "GPPShareActivity.h"


@interface RootViewController ()

@property (strong, nonatomic) UIPopoverController* activityPopoverController;

@end


@implementation RootViewController

- (void)loadView
{
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"Google+ Sharing";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareButtonClicked:)];
}

#pragma mark - Actions

- (void) shareButtonClicked:(UIBarButtonItem*)sender
{
    // toggle activity popover on iPad. Show the modal share dialog on iPhone
    if(!self.activityPopoverController) {
        
        // set up items to share
        NSArray* activityItems = @[ @"Hello Google+!" ];
        
        // set up and present activity view controller
        GPPShareActivity* gppShareActivity = [[GPPShareActivity alloc] init];
        UIActivityViewController* activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:@[gppShareActivity]];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            // present in popup
            self.activityPopoverController = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
            [self.activityPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            
        } else {
            // present modally
            [self presentViewController:activityViewController animated:YES completion:NULL];
        }
        
    } else {
        [self.activityPopoverController dismissPopoverAnimated:YES];
        self.activityPopoverController = nil;
    }
}

@end