//
//  RootViewController.h
//  FireUIPagedScrollViewiPadSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController

@property (nonatomic, retain) IBOutlet UINavigationController *detailViewController;

@end
