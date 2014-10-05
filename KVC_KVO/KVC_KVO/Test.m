//
//  Test.m
//  ImageSearch
//
//  Created by Jingshu Huang on 10/3/14.
//  Copyright (c) 2014 HuangImage. All rights reserved.
//

#import "Test.h"


static void *test1Context = &test1Context;
static void *test2Context = &test2Context;


@implementation Test

- (id)init {
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.child = nil;
        self.siblings = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)run {
    //    [self setValue:@"someVal" forKey:@"testProp"];
    [self setValue:@"plain" forKeyPath:@"child.name"];
}


//http://www.appcoda.com/understanding-key-value-observing-coding/

// Notice how the siblings array name is used in the above declarations, and
// that the first letter is always capital.
-(NSUInteger)countOfSiblings {
    return [self.siblings count];
}

-(id)objectInSiblingsAtIndex:(NSUInteger)index {
    return self.siblings[index];
}


//-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index {
-(void)insertObject:(id)object inSiblingsAtIndex:(NSUInteger)index {
    [self.siblings insertObject:object atIndex:index];
}

-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index {
    [self.siblings removeObjectAtIndex:index];
}

@end


@implementation Wrapper

// NO EFFECT??
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.test1 = [[Test alloc] init];
    self.test1.name = @"test1";
    Test *child = [[Test alloc] init];
    [self.test1 setValue:child forKeyPath:@"child"];

    self.test2 = [[Test alloc] init];
    self.test2.name = @"test2";
    Test *child2 = [[Test alloc] init];
    [self.test2 setValue:child2 forKeyPath:@"child"];
}

- (void)registerKVO {
    // KVO
    [self.test1 addObserver:self
                 forKeyPath:@"name"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:test1Context];
    [self.test1 addObserver:self
                 forKeyPath:@"age"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:test1Context];
    
    [self.test2 addObserver:self
                 forKeyPath:@"name"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:test2Context];
    [self.test2 addObserver:self
                 forKeyPath:@"age"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:test2Context];

    // NSArray
    [self.test1 addObserver:self
                 forKeyPath:@"siblings"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:nil];
}

- (void)unregisterKVO {
    [self.test1 removeObserver:self forKeyPath:@"name"];
    [self.test1 removeObserver:self forKeyPath:@"age"];
    [self.test2 removeObserver:self forKeyPath:@"name"];
    [self.test2 removeObserver:self forKeyPath:@"age"];

    // NSArray
    [self.test1 removeObjectFromSiblingsAtIndex:1];
}

- (void)run {
    // KVC (NSKeyValueCoding protocol)
    [self.test1 setValue:@"test2" forKey:@"name"];
    NSLog(@"1: %@", [self.test1 valueForKey:@"name"]);
    self.test1.name = @"testName2";
    [self.test1 setValue:@"testName3" forKey:@"name"];

    self.test1.child.name = @"child";
    [self.test1.child setValue:@"childName1" forKey:@"name"];
    NSLog(@"2: %@", [self.test1.child valueForKey:@"name"]);

    [self.test1 setValue:@"plain" forKeyPath:@"child.name"];
    [self.test1 setValue:@(5) forKeyPath:@"child.age"];
    NSLog(@"3: %@, %@", [self.test1.child valueForKey:@"name"],
                        [self.test1.child valueForKey:@"age"]);

    [self.test2 willChangeValueForKey:@"name"];
    [self.test2 setValue:@"TEST2NAME" forKey:@"name"];  // CALL observeValueForKeyPath once
    [self.test2 didChangeValueForKey:@"name"];    // CALL observeValueForKeyPath twice

    [self.test2 setValue:@(20) forKey:@"age"];

    // NSArray
    [self.test1 insertObject:@"Alex" inSiblingsAtIndex:0];
    [self.test1 insertObject:@"Bob" inSiblingsAtIndex:1];
    [self.test1 insertObject:@"Mary" inSiblingsAtIndex:2];
}

// KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {

    if (context == test1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the child was changed. %@, %@", object, keyPath);
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child was changed. %@, %@", object, keyPath);
            NSLog(@"%@", change);
        }
    } else if (context == test2Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the child was changed. %@, %@", object, keyPath);
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child was changed. %@, %@", object, keyPath);
            NSLog(@"%@", change);
        }
    } else {
        if ([keyPath isEqualToString:@"siblings"]) {
            NSLog(@"%@", change);
        }
    }
}

@end

