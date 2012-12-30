//
//  SimpleSampleView.m
//  FireUIPagedScrollViewiPadSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//

#import "SimpleSampleView.h"
#import "Page1View.h"
#import "Page2View.h"
#import "Page3View.h"

@implementation SimpleSampleView
@synthesize pagedScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.pagedScrollView addPagedViewController:[[Page1View alloc] initWithNibName:@"Page1View" bundle:nil]];
    [self.pagedScrollView addPagedViewController:[[Page2View alloc] initWithNibName:@"Page2View" bundle:nil] ];
    [self.pagedScrollView addPagedViewController:[[Page3View alloc] initWithNibName:@"Page3View" bundle:nil]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pagedScrollView = nil;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    // REQUIRED TO MAKE THE TRANSITION SMOOTHLY BETWEEN ORIENTATIONS
    [self.pagedScrollView willRotateToInterfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
