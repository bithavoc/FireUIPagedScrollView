//
//  OrientationReadyPagesView.m
//  FireUIPagedScrollViewiPhoneSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//  http://www.firebase.co
//

#import "OrientationReadyPagesView.h"
#import "SimplePage1View.h"
#import "SimplePage2View.h"
#import "SimplePage3View.h"

@implementation OrientationReadyPagesView
@synthesize pagedScrollView;


#pragma mark - IMPORTANT STUFF!!!

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Let the device change the orientation...
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    // REQUIRED TO MAKE THE TRANSITION SMOOTHLY BETWEEN ORIENTATIONS
    [self.pagedScrollView willRotateToInterfaceOrientation];
}

#pragma mark - Usual stuff
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Orientation Demo";
    
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
