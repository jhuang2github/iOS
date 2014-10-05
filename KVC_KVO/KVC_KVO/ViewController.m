//
//  ViewController.m
//  KVC_KVO
//
//  Created by Jingshu Huang on 10/3/14.
//  Copyright (c) 2014 HuangImage. All rights reserved.
//

#import "Test.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) Wrapper *wrapper;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self runOnce];
}

- (void)runOnce {
    self.wrapper = [[Wrapper alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.wrapper registerKVO];
    [self.wrapper run];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.wrapper unregisterKVO];
}

@end
