//
//  RecipeDetailViewController.m
//  RecipeCoreData
//
//  Created by Jingshu Huang on 10/4/14.
//  Copyright (c) 2014 HuangImage. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Mine
    if (self.recipe) {
        [self.name setText:[self.recipe valueForKey:@"name"]];
        [self.version setText:[self.recipe valueForKey:@"version"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Mine
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

// Mine
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Mine
- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];

    if (self.recipe) {
        // Update
        [self.recipe setValue:self.name.text forKey:@"name"];
        [self.recipe setValue:self.version.text forKey:@"version"];
        
    } else {
        // Create a new managed object
        self.recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:context];
        [self.recipe setValue:self.name.text forKey:@"name"];
        [self.recipe setValue:self.version.text forKey:@"version"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
