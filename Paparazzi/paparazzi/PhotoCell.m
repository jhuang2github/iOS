//
//  PhotoCell.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/20/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import "PhotoCell.h"


@implementation PhotoCell
@synthesize imageView, imageOwner, imageText;

- (IBAction)editBegin {
    imageText.borderStyle = UITextBorderStyleRoundedRect;
}

- (IBAction)editEnd {
    imageText.borderStyle = UITextBorderStyleNone;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    NSLog(@"done pressed.");
    // update image name. photos[owner][imagename].description = imageText.text
    info.description = imageText.text;
    return YES;
}

- (id)initWithPhotoInfo:(PhotoInfo*)theInfo {
    self = [super init];
    if (!self) {
        return nil;
    }

    NSArray *nibObjs = [[NSBundle mainBundle]
                        loadNibNamed:@"PhotoCell" owner:self options:nil];
    UIView *loadedView = [nibObjs objectAtIndex:0];
    [super addSubview:loadedView];
        
    info = [[theInfo retain] autorelease];
    return self;
}

- (void)dealloc {
    [imageText release];
    [imageView release];
    [imageOwner release];
    [super dealloc];
}

@end
