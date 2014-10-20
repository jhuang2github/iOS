//
//  PhotoListViewControllerWithXib.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoListViewControllerWithXib : UIViewController {
    NSArray  *photos;       // a list of photos to show
    NSString *ownerName;    // current owner name to display.    
}

@property (nonatomic, copy) NSString *ownerName;
@property (nonatomic, assign) NSArray *photos;

@end
