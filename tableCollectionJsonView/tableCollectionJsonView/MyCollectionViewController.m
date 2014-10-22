//
//  MyCollectionViewController.m
//  tableCollectionJsonView
//
//  Created by Jingshu Huang on 10/21/14.
//  Copyright (c) 2014 Jingshu Huang. All rights reserved.
//
// 1. UICollectionView
//
// http://www.raywenderlich.com/22324/beginning-uicollectionview-in-ios-6-part-12
//
// 2. load from json
// http://stackoverflow.com/questions/2968642/populate-uitableview-from-json


#import "MyCollectionViewController.h"

@interface MyCollectionViewController () {
    NSDictionary *dict;
    NSString *recipe;
    NSString *thumbnail;
    NSString *prepTime;
}

@property (nonatomic) NSMutableArray *recipes;

@end

@implementation MyCollectionViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    // from plist
    //NSString *myfile = [[NSBundle mainBundle] pathForResource:@"exercise" ofType:@"plist"];
    //exercises = [[NSArray alloc] initWithContentsOfFile:myfile];

    // from network in json format.
//    responseData = [[NSMutableData data] retain];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://url_to_json"]];
//    [[NSURLConnection alloc] initWithRequest:request delegate:self ];

    recipe = @"recipe";
    thumbnail = @"thumbnail";
    prepTime = @"time";

    // TODO(jhuang): move the fetch of data to background thread.
    self.recipes = [[NSMutableArray alloc] init];
    NSData *jsonSource = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://gooruism.com/feed/json"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dataDict in jsonObjects) {
        NSString *recipe_data = [dataDict objectForKey:@"title"];
        NSString *thumbnail_data = [dataDict objectForKey:@"thumbnail"];
        NSString *time_data = [dataDict objectForKey:@"author"];
        
        dict = @{recipe : recipe_data,
                 thumbnail : thumbnail_data,
                 prepTime : time_data};
        [self.recipes addObject:dict];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[tableView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.recipes count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collectionCell";

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];

    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    NSDictionary *dictObj = [self.recipes objectAtIndex:indexPath.row];
    imageView.image = [UIImage imageNamed:dictObj[@"thumbnail"]];
    
    return cell;
}


@end
