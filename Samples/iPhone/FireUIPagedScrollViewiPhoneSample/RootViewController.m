//
//  RootViewController.m
//  FireUIPagedScrollViewiPhoneSample
//
//  Created by Johan Hernandez on 8/24/11.
//  Copyright 2011 Firebase. All rights reserved.
//  http://www.firebase.co
//

#import "RootViewController.h"
#import "SimplePagesView.h"
#import "OrientationReadyPagesView.h"
#import "VisualsReadyView.h"

#define kSimpleRow 0
#define kOrientationReadyRow 1
#define kVisualsControlsReadyRow 2

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Demos";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    switch (indexPath.row) {
        case kSimpleRow:
            cell.textLabel.text = @"Simple Pages Sample";
            break;
        case kOrientationReadyRow:
            cell.textLabel.text = @"Orientation Pages Sample";
            break;
        case kVisualsControlsReadyRow:
            cell.textLabel.text = @"Visual Controls Sample";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case kSimpleRow: {
            SimplePagesView *detailViewController = [[SimplePagesView alloc] initWithNibName:@"SimplePagesView" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        }
        case kOrientationReadyRow: {
            OrientationReadyPagesView *detailViewController = [[OrientationReadyPagesView alloc] initWithNibName:@"OrientationReadyPagesView" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        }
        case kVisualsControlsReadyRow: {
            VisualsReadyView *detailViewController = [[VisualsReadyView alloc] initWithNibName:@"VisualsReadyView" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        }
        default:
            break;
    }
}

@end
