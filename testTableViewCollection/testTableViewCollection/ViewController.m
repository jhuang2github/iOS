//
//  ViewController.m
//  testTableViewCollection
//
//  Created by Jingshu Huang on 10/21/14.
//  Copyright (c) 2014 Jingshu Huang. All rights reserved.
//
// 1) tableview:
// http://www.appcoda.com/enhance-your-simple-table-app-with-property-list/
// 

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSArray *recipes;
@property (nonatomic) NSArray *thumbnails;
@property (nonatomic) NSArray *prepTime;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.recipes = @[@"1", @"2", @"3"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.recipes = [dict objectForKey:@"RecipeName"];
    self.thumbnails = [dict objectForKey:@"Thumbnail"];
    self.prepTime = [dict objectForKey:@"PrepTime"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellId = @"mycell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }

    cell.textLabel.text = [self.recipes objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.prepTime objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.thumbnails objectAtIndex:indexPath.row]];
    cell.backgroundColor = indexPath.row % 2 == 0 ? [UIColor lightGrayColor] : [UIColor darkGrayColor];

    return cell;
}

#pragma mark - data delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%d", indexPath.row);
}

@end
