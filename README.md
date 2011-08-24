# FireUIPagedScrollView

Very nice UIScrollView ready to handle View Controllers as pages, handle orientation changes and integrate with UIPageControl and UISegmentedControl out of the box. iPhone & iPad Samples included!


## Features

* Handles Orientation and Size changes automatically and with smooth animations.
* Ready to work with [UIPageControl](http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIPageControl_Class/Reference/Reference.html) and [UISegmentedControl](http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UISegmentedControl_Class/Reference/UISegmentedControl.html)
* Easy to use properties and methods (addPagedViewController, pageCount, currentPage, etc)

## Screenshots

![iPad](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPad/IMG_0001.png)
![iPad](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPad/IMG_0002.png)
![iPad](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPad/IMG_0003.png)
![iPad](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPad/IMG_0004.png)
![iPhone](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPhone/IMG_0745.png)
![iPhone](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPhone/IMG_0746.png)
![iPhone](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPhone/IMG_0747.png)
![iPhone](/firebaseco/FireUIPagedScrollView/raw/master/Screenshots/iPhone/IMG_0748.png)
## Example

Let's setup you have three View controllers that you want to show as pages as follows:

* Page1ViewController.h
* Page2ViewController.h
* Page3ViewController.h

1.Include the header for FireUIPagedScrollView.h

    #import "FireUIPagedScrollView.h"

2.Drag a UIScrollView to your Nib and then change it's class to FireUIPagedScrollView, then Bind the outlet.

    @property (nonatomic, retain) IBOutlet FireUIPagedScrollView * pagedScrollView;

3.Create Controllers and add them as pages:

    - (void)viewDidLoad
    {
    	[super viewDidLoad];
		// Add Page 1
	    [self.pagedScrollView addPagedViewController:[[[Page1ViewController alloc] initWithNibName:@"Page1View" bundle:nil] autorelease]];
		// Add Page 2
	    [self.pagedScrollView addPagedViewController:[[[Page2ViewController alloc] initWithNibName:@"Page2View" bundle:nil] autorelease]];
		// Add Page 3
	    [self.pagedScrollView addPagedViewController:[[[Page3ViewController alloc] initWithNibName:@"Page3View" bundle:nil] autorelease]];
    }

## Handling Orientation Changes

To handle orientation properly while keeping the current page index and animate the new size of the screen, FireUIPagedScrollView needs to know when a Rotation of the Screen is going to occur.

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    // REQUIRED TO MAKE THE TRANSITION SMOOTHLY BETWEEN ORIENTATIONS
    [self.pagedScrollView willRotateToInterfaceOrientation];
}

## Start using it

Get the source code and run the samples for iPhone or iPad:

	    git clone git://github.com/firebaseco/FireUIPagedScrollView.git


## Author
Johan Hernandez: johan@firebase.co
Drop me an email if you need anything, thanks!

## License

Copyright (c) 2011 Firebase.co

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.