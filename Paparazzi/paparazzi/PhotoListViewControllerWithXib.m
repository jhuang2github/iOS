//
//  PhotoListViewControllerWithXib.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoListViewControllerWithXib.h"


@implementation PhotoListViewControllerWithXib
@synthesize ownerName, photos;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    self.ownerName = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
