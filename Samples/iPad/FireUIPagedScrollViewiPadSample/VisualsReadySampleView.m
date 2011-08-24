//
//  VisualsReadySampleView.m
//  FireUIPagedScrollViewiPadSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//

#import "VisualsReadySampleView.h"
#import "Page1View.h"
#import "Page2View.h"
#import "Page3View.h"

@implementation VisualsReadySampleView
@synthesize pagedScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
     Nothing to see here hehe, everything was made in Interface Builder :) If you want to use UIPageControl or UISegmentedControl you can use Interface Builder to assign the outlets properties pageControl and segmentedControl.
     */
    
    [self.pagedScrollView addPagedViewController:[[[Page1View alloc] initWithNibName:@"Page1View" bundle:nil] autorelease]];
    [self.pagedScrollView addPagedViewController:[[[Page2View alloc] initWithNibName:@"Page2View" bundle:nil] autorelease]];
    [self.pagedScrollView addPagedViewController:[[[Page3View alloc] initWithNibName:@"Page3View" bundle:nil] autorelease]];
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
