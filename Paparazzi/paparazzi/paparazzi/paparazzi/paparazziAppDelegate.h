//
//  paparazziAppDelegate.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonListViewController.h"

@interface paparazziAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UINavigationController* navCtrl;
    //IBOutlet UINavigationController* navCtrl2;
    IBOutlet PersonListViewController* personListViewCtrl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
