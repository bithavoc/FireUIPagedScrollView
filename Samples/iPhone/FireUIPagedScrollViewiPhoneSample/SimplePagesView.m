//
//  SimplePagesView.m
//  FireUIPagedScrollViewiPhoneSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//  http://www.firebase.co
//

#import "SimplePagesView.h"
#import "SimplePage1View.h"
#import "SimplePage2View.h"
#import "SimplePage3View.h"

@implementation SimplePagesView
@synthesize pagedScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Simple Demo";
    
    // Add Page 1
    [self.pagedScrollView addPagedViewController:[[[SimplePage1View alloc] initWithNibName:@"SimplePage1View" bundle:nil] autorelease]];
    
    // Add Page 2
    [self.pagedScrollView addPagedViewController:[[[SimplePage2View alloc] initWithNibName:@"SimplePage2View" bundle:nil] autorelease]];
    
    // Add Page 3
    [self.pagedScrollView addPagedViewController:[[[SimplePage3View alloc] initWithNibName:@"SimplePage3View" bundle:nil] autorelease]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pagedScrollView = nil;
}


@end
