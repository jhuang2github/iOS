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
//
// 4) load data from plist
// http://www.appcoda.com/enhance-your-simple-table-app-with-property-list/
//
// 5) load from json / network
// http://www.thedarkdev.com/web-service-apps-in-ios7-json-with-uitableview.html
// http://stackoverflow.com/questions/2968642/populate-uitableview-from-json
// http://nscookbook.com/2013/03/ios-programming-recipe-16-populating-a-uitableview-with-data-from-the-web/
//
// 6) UICollectionView (**)
// i) (**) http://www.appcoda.com/ios-programming-uicollectionview-tutorial/
//https://developer.apple.com/library/ios/samplecode/CollectionView-Simple/Introduction/Intro.html#//apple_ref/doc/uid/DTS40012860-Intro-DontLinkElementID_2
// ii) search bar with segue
//
//navi controller and table view
//http://www.appcoda.com/use-storyboards-to-build-navigation-controller-and-table-view/
//segue and pass data
//http://www.appcoda.com/storyboards-ios-tutorial-pass-data-between-view-controller-with-segue/
//tab bar
//http://www.appcoda.com/storyboard-tutorial-create-tab-bar-controller-and-web-view/
//search bar
//http://www.appcoda.com/search-bar-tutorial-ios7/
//http://www.raywenderlich.com/16873/how-to-add-search-into-a-table-view
//other courses:
//http://www.appcoda.com/ios-programming-course/
//
// iii) Photo viewer:
//***
//http://www.raywenderlich.com/19788/how-to-use-nsoperations-and-nsoperationqueues


#import "MyTableViewController.h"

@interface MyTableViewController ()

// programmatically.
//@property (nonatomic) UITableView *tableView;

@property (nonatomic) NSArray *recipes;
@property (nonatomic) NSArray *thumbnails;
@property (nonatomic) NSArray *prepTime;

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
//    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

    // load data from file:
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.recipes = [dict objectForKey:@"RecipeName"];
    self.thumbnails = [dict objectForKey:@"Thumbnail"];
    self.prepTime = [dict objectForKey:@"PrepTime"];

    // programmatically create table view
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];

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
    return [self.recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.textLabel.text = [self.recipes objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [self.prepTime objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.thumbnails objectAtIndex:indexPath.row]];
//    cell.imageView.frame = CGRectMake(0, 0, 80, 70);
    cell.backgroundColor = indexPath.row % 2 == 0 ? [UIColor lightGrayColor] : [UIColor darkGrayColor];

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

#pragma mark - navigate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSString *content = ((UITableViewCell *)sender).textLabel.text;
        NSLog(@"%@", content);

//        ImageCollectionViewController *destVC = segue.destinationViewController;
//        destVC.search = content;
    }
}


@end
