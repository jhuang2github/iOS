//
//  PhotoDetailViewController.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/15/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import "PhotoDetailViewController.h"


@implementation PhotoDetailViewController
@synthesize imageName;

- (void)dealloc {
    self.imageName = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:imageName];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(0, 0, 320, 320);
    [self.view addSubview:imageView];
}

- (void)viewDidUnload {
    [imageView release];
    imageView = nil;
    [super viewDidUnload];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView*)scrollView {
    return imageView;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

@end
