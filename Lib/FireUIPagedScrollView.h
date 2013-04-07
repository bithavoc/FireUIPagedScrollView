//
//  FireUIPagedScrollView.h
//
//  Created by Johan Hernandez<johan@firebase.co> on 8/23/11.
//  Copyright 2011 Firebase. All rights reserved.
//  http://www.firebase.co
//  https://github.com/firebaseco/FireUIPagedScrollView
//

#import <UIKit/UIKit.h>

@protocol FireUIPagedScrollViewDelegate;

@interface FireUIPagedScrollView : UIScrollView<UIScrollViewDelegate> 

// Set the delegate to get notified when the current page is changed.
@property (nonatomic, strong) IBOutlet id<FireUIPagedScrollViewDelegate> pagerDelegate;

// The current page index. (Zero based).
@property (nonatomic) NSInteger currentPage;

// The number of Pages.
@property (nonatomic, readonly) NSInteger pageCount;

// Set a UIPageControl to handle selection of Pages and provide visual feedback.
@property (nonatomic, strong) IBOutlet UIPageControl * pageControl;

// Set a UISegmentedControl to handle selection of Pages and provide visual feedback.
@property (nonatomic, strong) IBOutlet UISegmentedControl * segmentedControl;

// Adds a Controller.
-(void)addPagedViewController:(UIViewController*)controller;

// Adds a Controller indicating whether the action should be animated.
-(void)addPagedViewController:(UIViewController*)controller animated:(BOOL)animated;

// Removes a Controller.
-(void)removePagedViewControllerAtIndex:(NSUInteger)index;

// Removes a Controller indicating whether the action should be animated.
-(void)removePagedViewControllerAtIndex:(NSUInteger)index animated:(BOOL)animated;

// Shows a Specific Page Index
-(void)gotoPage:(NSInteger)pageIndex animated:(BOOL)animated;

// Call this method on willRotateToInterfaceOrientation is called in the host controller.
-(void)willRotateToInterfaceOrientation;

-(IBAction)paginationControlChanged:(id)sender;

@end

@protocol FireUIPagedScrollViewDelegate<NSObject>
@optional

// Occurs when the current page is changed, a new page is added or a page removed. Use this callback to update your visual control(in case you dont want to use pageControl or segmentedControl properties)
-(void)firePagerChanged:(FireUIPagedScrollView*)pager pagesCount:(NSInteger)pagesCount currentPageIndex:(NSInteger)currentPageIndex;
@end
