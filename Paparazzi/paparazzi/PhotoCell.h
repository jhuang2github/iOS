//
//  PhotoCell.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/20/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoInfo.h"


@interface PhotoCell : UITableViewCell {
    PhotoInfo* info;
}

@property (nonatomic, retain) IBOutlet UIImageView* imageView;
@property (nonatomic, retain) IBOutlet UILabel* imageOwner;
@property (nonatomic, retain) IBOutlet UITextField* imageText;

- (id)initWithPhotoInfo:(PhotoInfo*)theInfo;

- (IBAction)editBegin;
- (IBAction)editEnd;

@end
