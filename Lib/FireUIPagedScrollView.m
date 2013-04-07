//
//  FireUIPagedScrollView.m
//
//  Created by Johan Hernandez<johan@firebase.co> on 8/23/11.
//  Copyright 2011 Firebase. All rights reserved.
//  http://www.firebase.co
//  https://github.com/firebaseco/FireUIPagedScrollView
//

#import "FireUIPagedScrollView.h"

@interface FireUIPagedScrollView(hidden)

-(void)_niceInit;
-(void)_adjustSizesForPages:(UIViewController *)removedControllerOrNil;
-(void)_adjustSizesForPages:(UIViewController *)removedControllerOrNil animated:(BOOL)animated;
-(void)_notifyPageChanged;
-(void)_showPage:(NSInteger)pageIndex animated:(BOOL)animated;
-(void)_adjustSizesForPagesCoreInit;
-(void)_adjustSizesForPagesCoreCompletion;
@end

@implementation FireUIPagedScrollView {
    NSMutableArray * _controllers;
    NSInteger _currentPage;
    BOOL _dontInferPagesFromScrollRange;
    UIPageControl * _pageControl;
    UISegmentedControl * _segmentedControl;
    BOOL _ignoreValueChangedEvent;
}

@synthesize pagerDelegate;

- (id)init
{
    self = [super init];
    if (self) {
        [self _niceInit];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self _niceInit];
    }
    return self;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self _adjustSizesForPages:nil];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self _niceInit];
    }
    return self;
}

-(void)_niceInit {
    _controllers = [[NSMutableArray alloc] init];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = false;
    self.showsVerticalScrollIndicator = false;
    self.delegate = self;
    
}

-(void)dealloc {
    self.pagerDelegate = nil;
    self.delegate = nil;
    self.segmentedControl = nil;
    self.pageControl = nil;
}


-(void)addPagedViewController:(UIViewController*)controller
{
    [self addPagedViewController:controller animated:YES];
}

-(void)addPagedViewController:(UIViewController*)controller animated:(BOOL)animated
{
    if(controller != nil && controller.view != nil) {
        [_controllers addObject:controller];
        [self addSubview:controller.view];
        [self _adjustSizesForPages:nil animated:animated];
        [self _notifyPageChanged];
    }
}

-(void)removePagedViewControllerAtIndex:(NSUInteger)index
{
    [self removePagedViewControllerAtIndex:index animated:YES];
}

-(void)removePagedViewControllerAtIndex:(NSUInteger)index animated:(BOOL)animated
{
    UIViewController *controller = [_controllers objectAtIndex:index];
    
    [_controllers removeObjectAtIndex:index];
    [self _adjustSizesForPages:controller animated:animated];
    [self _notifyPageChanged];
}

-(void)_adjustSizesForPages:(UIViewController *)removedControllerOrNil {
    [self _adjustSizesForPages:removedControllerOrNil animated:YES];
}

-(void)_adjustSizesForPages:(UIViewController *)removedControllerOrNil animated:(BOOL)animated {
    if(animated) {
        
        NSTimeInterval duration = 0.5;
        
        if(removedControllerOrNil) {
            duration = 0.25;
        }
        
        [UIView animateWithDuration:duration
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [self _adjustSizesForPagesCoreInit];
                         }
                         completion:^(BOOL finished){
                             if(removedControllerOrNil) {
                                 [removedControllerOrNil.view removeFromSuperview];
                             }
                             
                             [self _adjustSizesForPagesCoreCompletion];
                         }];
    } else {
        if(removedControllerOrNil) {
            [removedControllerOrNil.view removeFromSuperview];
        }
        
        [self _adjustSizesForPagesCoreInit];
        [self _adjustSizesForPagesCoreCompletion];
    }
}

-(void)_adjustSizesForPagesCoreInit {
    CGSize currentSize = self.frame.size;
    NSInteger loopPageNumber = 0;
    for (UIViewController * controller in _controllers) {
        [controller.view setFrame:CGRectMake(currentSize.width * loopPageNumber, 0, currentSize.width, currentSize.height)];
        loopPageNumber++;
    }
    [self setContentSize:CGSizeMake(currentSize.width * loopPageNumber, currentSize.height)];
}

-(void)_adjustSizesForPagesCoreCompletion {
    _dontInferPagesFromScrollRange = NO;
    [self _showPage:self.currentPage animated:NO];
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if(!_dontInferPagesFromScrollRange) {
        // Update the page when more than 50% of the previous/next page is visible
        CGFloat pageWidth = self.frame.size.width;
        int page = floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.currentPage = page;
    }
}

-(NSInteger) pageCount {
    return [_controllers count];
}

-(NSInteger)currentPage {
    return _currentPage;
}

-(void)setCurrentPage:(NSInteger)page {
    if(_currentPage == page) return;
    _currentPage = page;
    [self _notifyPageChanged ];
}

-(void)_notifyPageChanged {
    _ignoreValueChangedEvent = YES;
    if([pagerDelegate respondsToSelector:@selector(firePagerChanged:pagesCount:currentPageIndex:)]) {
        [pagerDelegate firePagerChanged:self pagesCount:self.pageCount currentPageIndex:self.currentPage];
    }
    if(_segmentedControl != nil &&  [_segmentedControl selectedSegmentIndex] != _currentPage) {
        _segmentedControl.selectedSegmentIndex = _currentPage;
    }
    if(_pageControl != nil &&  [_pageControl currentPage] != _currentPage) {
        _pageControl.currentPage = _currentPage;
    }
    if(_pageControl != nil) {
        _pageControl.numberOfPages = self.pageCount;
    }
    _ignoreValueChangedEvent = NO;
}

-(void)gotoPage:(NSInteger)pageIndex animated:(BOOL)animated {
    if(pageIndex == self.currentPage) return;
    [self _showPage:pageIndex animated:animated];
}

-(void)_showPage:(NSInteger)pageIndex animated:(BOOL)animated {
    
    CGRect frame;
    frame.origin.x = self.frame.size.width * pageIndex;
    frame.origin.y = 0;
    frame.size = self.frame.size;
    [self scrollRectToVisible:frame animated:animated];
    
}

-(void)willRotateToInterfaceOrientation {
    _dontInferPagesFromScrollRange = true;
    UIDevice *device = [UIDevice currentDevice];					//Get the device object
	[device beginGeneratingDeviceOrientationNotifications];			//Tell it to start monitoring the accelerometer for orientation
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];	//Get the notification centre for the app
	[nc addObserver:self											//Add yourself as an observer
		   selector:@selector(orientationChanged:)
			   name:UIDeviceOrientationDidChangeNotification
			 object:device];
}
- (void)orientationChanged:(NSNotification *)note
{
    [self _adjustSizesForPages:nil];
    
    UIDevice *device = [UIDevice currentDevice];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:UIDeviceOrientationDidChangeNotification object:device];
}

-(void)paginationControlChanged:(id)sender {
    if(!_ignoreValueChangedEvent) {
        NSInteger currentPage = -1;
        if([sender isKindOfClass:[UISegmentedControl class]]) {
            currentPage = ((UISegmentedControl*)sender).selectedSegmentIndex;
        } else {
            currentPage = ((UIPageControl*)sender).currentPage;
        }
        if(currentPage > -1) {
            [self gotoPage:currentPage animated:YES];
        }
    }
}
-(UIPageControl*)pageControl {
    return _pageControl;
}
-(void)setPageControl:(UIPageControl *)pageControl {
    if(_pageControl != nil) {
        [_pageControl removeTarget:self action:@selector(paginationControlChanged:) forControlEvents:UIControlEventValueChanged];
    }
    _pageControl = pageControl;
    if(_pageControl != nil) {
        [_pageControl addTarget:self action:@selector(paginationControlChanged:) forControlEvents:UIControlEventValueChanged];
    }
}
-(UISegmentedControl*) segmentedControl {
    return _segmentedControl;
}
-(void)setSegmentedControl:(UISegmentedControl *)segmentedControl {
    if(_segmentedControl != nil) {
        [_segmentedControl removeTarget:self action:@selector(paginationControlChanged:) forControlEvents:UIControlEventValueChanged];
    }
    _segmentedControl = segmentedControl;
    if(_segmentedControl != nil) {
        [_segmentedControl addTarget:self action:@selector(paginationControlChanged:) forControlEvents:UIControlEventValueChanged];
    }
}
@end
