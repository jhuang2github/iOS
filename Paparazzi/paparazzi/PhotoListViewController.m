//
//  PhotoListViewController.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import "PhotoListViewController.h"
#import "PhotoInfo.h"

#define USE_XIB 1

@implementation PhotoListViewController
@synthesize ownerName, photos;
//@synthesize tmpCell, cellNib;

- (void)dealloc
{
    NSLog(@"PhotoList::dealloc");
    self.photos = nil;
    self.ownerName = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    NSLog(@"PhotoList::viewDidLoad");
    [super viewDidLoad];
    self.tableView.rowHeight = 95; 
}

- (void)viewDidUnload
{
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoDetailViewController* photoDetailViewCtrl =
        [[PhotoDetailViewController alloc] init];
    
    // Get row related info for display photo details.
    PhotoInfo* info = [photos objectAtIndex:indexPath.row];
    photoDetailViewCtrl.title = info.description;
    photoDetailViewCtrl.imageName = info.name;
    [self.navigationController pushViewController:photoDetailViewCtrl
                                         animated:YES];
    [photoDetailViewCtrl release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [photos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellIdentifier = @"PhotoCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:kCellIdentifier];
    PhotoInfo *info = [photos objectAtIndex:indexPath.row];
 
#if USE_XIB
    PhotoCell* cellView;
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:kCellIdentifier] autorelease];

        cellView = [[[PhotoCell alloc] initWithPhotoInfo:info] autorelease];
        cellView.frame = cell.contentView.bounds;
        [cell.contentView addSubview:cellView];
    } else {
        cellView = [cell.contentView.subviews objectAtIndex:0];
    }

    cellView.imageText.text = info.description;
    cellView.imageOwner.text = ownerName;
    cellView.imageView.image = [UIImage imageNamed:info.name];

#else
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:kCellIdentifier] autorelease];

    }
    cell.textLabel.text = info.description;
    cell.detailTextLabel.text = ownerName;
    cell.imageView.image = [UIImage imageNamed:info.name];
#endif

    return cell;
}

@end
