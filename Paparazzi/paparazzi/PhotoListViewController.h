//
//  PhotoListViewController.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoDetailViewController.h"
#import "PhotoCell.h"


// Photo list view controller
@interface PhotoListViewController : UITableViewController {
    NSArray  *photos;     // a list of photos to show
    NSString *ownerName;  // current owner name to display.
}

@property (nonatomic, retain) NSString *ownerName;
@property (nonatomic, retain) NSArray *photos;

@end
