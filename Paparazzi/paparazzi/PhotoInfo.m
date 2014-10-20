//
//  PhotoInfo.m
//  paparazzi
//
//  Created by Jingshu Huang on 6/16/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import "PhotoInfo.h"

@implementation PhotoInfo
@synthesize description, name;

- (id)initWithName:(NSString*)_name description:(NSString*)_description {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.description =  _description;
    self.name = _name;
    return self;
}

- (void)dealloc {
    self.description = nil;
    self.name = nil;
    [super dealloc];
}

@end