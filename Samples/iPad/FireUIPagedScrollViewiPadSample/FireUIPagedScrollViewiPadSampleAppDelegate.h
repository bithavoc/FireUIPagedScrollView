//
//  FireUIPagedScrollViewiPadSampleAppDelegate.h
//  FireUIPagedScrollViewiPadSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@class DetailViewController;

@interface FireUIPagedScrollViewiPadSampleAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

@property (nonatomic, retain) IBOutlet UINavigationController *detailViewController;

@end
