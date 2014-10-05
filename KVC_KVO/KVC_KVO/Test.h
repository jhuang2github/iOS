//
//  Test.h
//  ImageSearch
//
//  Created by Jingshu Huang on 10/3/14.
//  Copyright (c) 2014 HuangImage. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Test : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) Test *child;
// NOTE: NSArray are not KVC compliant!!
@property (nonatomic) NSMutableArray *siblings;

-(NSUInteger)countOfSiblings;
-(id)objectInSiblingsAtIndex:(NSUInteger)index;
-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index;
-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;

@end


@interface Wrapper : NSObject

@property (nonatomic) Test *test1;
@property (nonatomic) Test *test2;

- (void)registerKVO;
- (void)unregisterKVO;
- (void)run;

@end
