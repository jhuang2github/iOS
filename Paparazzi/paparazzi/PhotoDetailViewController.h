//
//  PhotoDetailViewController.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/15/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoDetailViewController :  UIViewController {
    UIImageView *imageView;
}

@property (nonatomic, retain) NSString* imageName;

@end
