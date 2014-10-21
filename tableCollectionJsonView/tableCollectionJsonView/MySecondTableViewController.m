//
//  MySecondTableViewController.m
//  tableCollectionJsonView
//
//  Created by Jingshu Huang on 10/21/14.
//  Copyright (c) 2014 Jingshu Huang. All rights reserved.
//

#import "MySecondTableViewController.h"
#import "SimpleTableCell.h"


@interface MySecondTableViewController () {
    __strong UITableView *tableView;
}

@property (nonatomic) NSArray *recipes;
@property (nonatomic) NSArray *thumbnails;
@property (nonatomic) NSArray *prepTime;

@end


@implementation MySecondTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    // create table view.
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];

    // load data from plist.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.recipes = [dict objectForKey:@"RecipeName"];
    self.thumbnails = [dict objectForKey:@"Thumbnail"];
    self.prepTime = [dict objectForKey:@"PrepTime"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = [_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [self.recipes objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[self.thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [self.prepTime objectAtIndex:indexPath.row];
    
    return cell;
}

@end
