//
//  paparazziAppDelegate.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonListViewController.h"

@interface paparazziAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController* tabCtrl;
    NSArray  *photos;                   // a list of all photos
    NSMutableDictionary *personPhotos;  // map from person to photos he owns.
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
