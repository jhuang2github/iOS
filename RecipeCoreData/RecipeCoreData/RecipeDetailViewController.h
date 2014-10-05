//
//  RecipeDetailViewController.h
//  RecipeCoreData
//
//  Created by Jingshu Huang on 10/4/14.
//  Copyright (c) 2014 HuangImage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic) NSManagedObject *recipe;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *version;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
