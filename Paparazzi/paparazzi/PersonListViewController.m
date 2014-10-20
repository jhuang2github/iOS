//
//  PersonListViewController.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import "PersonListViewController.h"


@implementation PersonListViewController
@synthesize personPhotos;

- (void)loadPersons
{
    [persons removeAllObjects];

    // load photos next to the name of each person.
    [persons setObject:@"avatar_boy2.png" forKey:@"John"];
    [persons setObject:@"avatar_boy_thumb.png" forKey:@"Alex"];
    [persons setObject:@"name.png" forKey:@"Kate"];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"PersonList::initWithStyle");
    self = [super initWithStyle:style];
    if (self) {
        persons = [[NSMutableDictionary alloc] init];
        [self loadPersons];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"PersonList::dealloc");
    [persons release];
    persons = nil;
    self.personPhotos = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    NSLog(@"PersonList::viewLoad");
    [super viewDidLoad];
    self.tableView.rowHeight = 95;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


// Get the key indexed into the sorted person photo dictionary.
- (NSString*)getSortedKeyAtIndex:(NSUInteger)index
{
    NSArray* sortedKeys = [[persons allKeys]
                           sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return [sortedKeys objectAtIndex:index];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get row related information for display.
    PhotoListViewController* photoListViewCtrl =
        [[PhotoListViewController alloc] init];
    NSString* ownerName = [self getSortedKeyAtIndex:indexPath.row];
    photoListViewCtrl.title = [NSString stringWithFormat:@"%@'s Photos",
                               ownerName];
    photoListViewCtrl.ownerName = [NSString stringWithFormat:@"%@", ownerName];
    photoListViewCtrl.photos = [personPhotos objectForKey:ownerName];
    
    // set up a short-named back button on photo detail view.
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Photos"
                                   style:UIBarButtonItemStyleBordered
                                   target:nil
                                   action:nil];
    photoListViewCtrl.navigationItem.backBarButtonItem = backButton;
    [backButton release];

    [self.navigationController pushViewController:photoListViewCtrl
                                         animated:YES];
    [photoListViewCtrl release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [persons count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"draw personCell");
    static NSString *kCellIdentifier = @"PersonCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:kCellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:kCellIdentifier] autorelease];
    }

    NSString* key = [self getSortedKeyAtIndex:indexPath.row];
    cell.textLabel.text = key;
    cell.imageView.image =[UIImage imageNamed:[persons objectForKey:key]];

    return cell;
}

@end
