//
//  RootViewController.m
//  FireUIPagedScrollViewiPadSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//

#import "RootViewController.h"
#import "VisualsReadySampleView.h"
#import "SimpleSampleView.h"

#define kAbout 0
#define kSimplePages 1
#define kVisualsReadyPages 2

#define kSamplesCount 3

@implementation RootViewController

@synthesize detailViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    		
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kSamplesCount;
    		
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    switch (indexPath.row) {
        case kSimplePages:
            cell.textLabel.text = @"Simple Pages Sample";
            break;
        case kVisualsReadyPages:
            cell.textLabel.text = @"Visual Controls Ready Sample";
            break;
        case kAbout:
            cell.textLabel.text = @"About";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.detailViewController popViewControllerAnimated:NO];
    switch (indexPath.row) {
        case kSimplePages: {
            SimpleSampleView * sampleView = [[SimpleSampleView alloc] initWithNibName:@"SimpleSampleView" bundle:nil];
            [self.detailViewController pushViewController:sampleView animated:YES];
            break;
        }
        case kVisualsReadyPages: {
            VisualsReadySampleView * sampleView = [[VisualsReadySampleView alloc] initWithNibName:@"VisualsReadySampleView" bundle:nil];
            [self.detailViewController pushViewController:sampleView animated:YES];
            break;
        }
        default:
            break;
    }
    
}

@end
