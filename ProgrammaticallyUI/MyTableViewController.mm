//
//  SearchHistoryViewController.m
//  ImageSearch
//
//  Created by Jingshu Huang on 9/28/14.
//  Copyright (c) 2014 HuangImage. All rights reserved.
//

#import "ImageCollectionViewController.h"
#import "SearchHistoryViewController.h"


@interface SearchHistoryViewController ()
@property (nonatomic) NSMutableOrderedSet *searches;
@property (nonatomic) NSArray *filteredSearches;
@end


@implementation SearchHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searches = [NSMutableOrderedSet orderedSetWithArray:@[]];

    
    // programmatically make tableview
//    self.tableView = [self makeTableView];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"newFriendCell"];
//    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


// mix: programmatically make taleview

//-(UITableView *)makeTableView {
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


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredSearches count];
    }
    return [self.searches count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"SearchCell";

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kCellIdentifier];
    }

    NSString *search = @"";
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        search = [self.filteredSearches objectAtIndex:indexPath.row];
    } else {
        search = [self.searches objectAtIndex:indexPath.row];
    }

    cell.textLabel.text = search;
//    cell.textLabel.font = [cell.textLabel.font fontWithSize:20];
//    cell.imageView.image = [UIImage imageNamed:@"icon57x57"];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i Games", friend.gameCount];
//    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    self.filteredSearches = [[self.searches array] filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString
            scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                    objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;  // reload the table view.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *keyWords = searchBar.text;
    [self updateSearchOrder:keyWords];
    [self performSegueWithIdentifier:@"showImageCollection" sender:self];
}

- (void)updateSearchOrder:(NSString *)keyWords {
    // Make sure the latest search shows up on the top of the list.
    [self.searches removeObject:keyWords];
    [self.searches insertObject:keyWords atIndex:0];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showImageCollection"]) {
        NSIndexPath *indexPath = nil;
        NSString *search = @"";
        
        if(sender == self.searchDisplayController.searchResultsTableView) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            search = [self.filteredSearches objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            search = [self.searches objectAtIndex:indexPath.row];
        }
        [self updateSearchOrder:search];

        ImageCollectionViewController *destVC = segue.destinationViewController;
        destVC.search = search;
    }
}

@end

/////
// use nib to create view
//
//@interface MyCustomView
// UIView@property(strong, nonatomic)IBOutletUILabel*Label;
//@end
//
//@implementation MyCustomView
//-(id)initWithCoder:(NSCoder*)aDecoder{
//    if((self=[super initWithCoder:aDecoder])){
//        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"MyCustomView"
//                                                        owner:self
//                                                      options:nil] objectAtIndex:0]];
//    }
//    return self;
//}
//
//
/////  Programmatically create view:
//
//-(id)initWithFrame:(CGRect)frame {
//    self=[super initWithFrame:frame];
//    if(self){
//        UILabel*label1 =[[UILabel alloc]initWithFrame:CGRectMake(20,30,200,44)];
//        label1.text =@"i am label 1";    [self addSubview:label1];
//
//        UILabel*label2 =[[UILabel alloc]initWithFrame:CGRectMake(20,80,200,44)];
//        label2.text =@"i am label 2";    [self addSubview:label2];
//    }
//    return self;
//}
//
//@implementationViewController
//  -(void)viewDidLoad  {
//      [super viewDidLoad];
//      CustomView* cv =[[CustomView alloc] initWithFrame:CGRectMake(10,10,230,400)];
//      [self.view addSubview:cv];
//      [cv release];
//}





