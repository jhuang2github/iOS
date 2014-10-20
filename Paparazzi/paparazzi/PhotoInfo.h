//
//  PhotoInfo.h
//  paparazzi
//
//  Created by Jingshu Huang on 6/16/11.
//  Copyright 2011 HuangImage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoInfo : NSObject {
}

@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *name;

- (id)initWithName:(NSString*)_name description:(NSString*)_description;

@end
