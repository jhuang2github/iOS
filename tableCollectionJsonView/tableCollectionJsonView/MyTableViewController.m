//
//  MyTableViewController.m
//  tableCollectionJsonView
//
//  Created by Jingshu Huang on 10/20/14.
//  Copyright (c) 2014 Jingshu Huang. All rights reserved.
//
//
// Reference:
// 1) TableView IB:
// http://www.appcoda.com/uitableview-tutorial-storyboard-xcode5/
//
// 2) TableView data from plist:
// http://www.appcoda.com/enhance-your-simple-table-app-with-property-list/
//
// 3) programmatically tableview with custom cell.
// http://jslim.net/blog/2013/03/22/ios-create-uitableview-with-custom-cell-programmatically/
// http://jainmarket.blogspot.com/2009/05/creating-custom-table-view-cell.html
// http://teckyy.com/2013/02/creating-table-view-controllers-programmatically/
// 4) load data from plist
// http://www.appcoda.com/enhance-your-simple-table-app-with-property-list/

#import "MyTableViewController.h"

@interface MyTableViewController () {
    NSArray *recipes;
}

@property (nonatomic) UITableView *tableView;

@end


@implementation MyTableViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

    // load data from file:
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];

    // programmatically create table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

//    self.tableView = [self makeTableView];
//    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - programmatically create table view

// http://stackoverflow.com/questions/15846707/creating-a-uitableview-programmatically
// https://developer.apple.com/library/mac/documentation/cocoa/conceptual/TableView/PopulatingView-TablesProgrammatically/PopulatingView-TablesProgrammatically.html

//-(UITableView *)makeTableView
//{
//    CGFloat x = 0;
//    CGFloat y = 50;
//    CGFloat width = self.view.frame.size.width;
//    CGFloat height = self.view.frame.size.height - 50;
//    CGRect tableFrame = CGRectMake(x, y, width, height);
//    
//    UITableView *tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
//    
//    tableView.rowHeight = 45;
//    tableView.sectionFooterHeight = 22;
//    tableView.sectionHeaderHeight = 22;
//    tableView.scrollEnabled = YES;
//    tableView.showsVerticalScrollIndicator = YES;
//    tableView.userInteractionEnabled = YES;
//    tableView.bounces = YES;
//    
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    
//    return tableView;
//}


@end
