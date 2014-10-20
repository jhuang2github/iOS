//
//  paparazziAppDelegate.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/14/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import "paparazziAppDelegate.h"
#import "PhotoInfo.h"

@implementation paparazziAppDelegate
@synthesize window=_window;

- (void)loadPhotos {
    NSLog(@"App::load all photos for all persons.");
    PhotoInfo* info1 = [[[PhotoInfo alloc]
                        initWithName:@"photo1.jpg" description:@"Flower"]
                        autorelease];
    PhotoInfo* info2 = [[[PhotoInfo alloc]
                        initWithName:@"photo2.jpg" description:@"Stair"]
                        autorelease];
    PhotoInfo* info3 = [[[PhotoInfo alloc]
                        initWithName:@"photo3.jpg" description:@"Leaves"]
                        autorelease];
    PhotoInfo* info4 = [[[PhotoInfo alloc]
                        initWithName:@"pic1.jpg" description:@"Sea"]
                        autorelease];

    // load all photos
    photos = [[NSArray alloc] initWithObjects:info1, info2, info3, info4, nil];

    // load photos next to the name of each person.
    personPhotos = [[NSMutableDictionary alloc] init];
    [personPhotos
     setObject:[[[NSArray alloc] initWithObjects:info2, info3, nil] autorelease]
     forKey:@"Alex"];
    [personPhotos
     setObject:[[[NSArray alloc] initWithObjects:info1, info4, nil] autorelease]
     forKey:@"John"];
    [personPhotos
     setObject:[[[NSArray alloc]
                 initWithObjects:info4, info2, info3, nil] autorelease]
     forKey:@"Kate"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // initialize data
    [self loadPhotos];

    tabCtrl = [[UITabBarController alloc] init];

    // Navigation Ctrl 1 with a view of persons
    UINavigationController* navCtrl = [[UINavigationController alloc] init];
    PersonListViewController* personListViewCtrl =
        [[PersonListViewController alloc] initWithStyle:UITableViewStylePlain];
    personListViewCtrl.title = @"Contacts";
    personListViewCtrl.tabBarItem.image = [UIImage imageNamed:@"all.png"];
    personListViewCtrl.personPhotos = personPhotos;
    [navCtrl pushViewController:personListViewCtrl animated:NO];
    [personListViewCtrl release];

    // Navigation Ctrl 2 with a view of recent photos
    UINavigationController* navCtrl2 = [[UINavigationController alloc] init];
    PhotoListViewController* recentPhotosViewCtrl =
        [[PhotoListViewController alloc] initWithStyle:UITableViewStylePlain];
    recentPhotosViewCtrl.title = @"Recent";
    recentPhotosViewCtrl.tabBarItem.image = [UIImage imageNamed:@"faves.png"];
    recentPhotosViewCtrl.ownerName = nil;
    recentPhotosViewCtrl.photos = photos;
    [navCtrl2 pushViewController:recentPhotosViewCtrl animated:NO];
    [recentPhotosViewCtrl release];

    // Tab Ctrl with nav ctrls
    tabCtrl.viewControllers = [NSArray arrayWithObjects:navCtrl, navCtrl2, nil];
    [navCtrl2 release];
    [navCtrl release];

    [self.window addSubview:tabCtrl.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [photos release];
    [personPhotos release];
    [tabCtrl release];
    [_window release];
    [super dealloc];
}

@end
