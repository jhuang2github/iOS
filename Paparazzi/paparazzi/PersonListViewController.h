//
//  PersonListViewController.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoListViewController.h"

@interface PersonListViewController : UITableViewController {
    // map from person name to thumbnail image. Owned.
    NSMutableDictionary *persons;
    // map from person name to photos he has. Not owned.
    NSMutableDictionary *personPhotos;
}

@property (nonatomic, retain) NSMutableDictionary *personPhotos;

@end
