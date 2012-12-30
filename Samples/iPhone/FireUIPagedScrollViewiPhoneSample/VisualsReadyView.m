//
//  VisualsReadyView.m
//  FireUIPagedScrollViewiPhoneSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//  http://www.firebase.co
//

#import "VisualsReadyView.h"
#import "SimplePage1View.h"
#import "SimplePage2View.h"
#import "SimplePage3View.h"

@implementation VisualsReadyView
@synthesize pagedScrollView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Visual Controls Demo";
    /*
     Nothing to see here hehe, everything was made in Interface Builder :) If you want to use UIPageControl or UISegmentedControl you can use Interface Builder to assign the outlets properties pageControl and segmentedControl.
     */
    
    // Add Page 1
    [self.pagedScrollView addPagedViewController:[[SimplePage1View alloc] initWithNibName:@"SimplePage1View" bundle:nil] ];
    
    // Add Page 2
    [self.pagedScrollView addPagedViewController:[[SimplePage2View alloc] initWithNibName:@"SimplePage2View" bundle:nil] ];
    
    // Add Page 3
    [self.pagedScrollView addPagedViewController:[[SimplePage3View alloc] initWithNibName:@"SimplePage3View" bundle:nil] ];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pagedScrollView = nil;
}

@end
