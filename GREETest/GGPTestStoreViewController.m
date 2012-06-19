//
//  GGPTestStoreViewController.m
//  GREETest
//
//  Created by Jack Reidy on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GGPTestStoreViewController.h"

@interface GGPTestStoreViewController ()

@end

@implementation GGPTestStoreViewController

@synthesize backButton, windowView, items;


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
    windowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    [self.view addSubview:windowView];
    
	backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundColor:[UIColor blackColor]];
    [backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setFrame:CGRectMake(10, 285, 60, 60)];
    [backButton setCenter:CGPointMake(15 + 30, 10 + 30)];
    [windowView addSubview:backButton];
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
	[names addObject:@"Red Color"];		//Add to end of array
	[names addObject:@"Green Color"];
    [names addObject:@"Yellow Color"];
    [names addObject:@"Purple Color"];
    
    NSMutableArray *prices = [[NSMutableArray alloc] init];
    NSNumber *nineNine = [NSNumber numberWithFloat:0.990f];
    NSNumber *oneNineNine = [NSNumber numberWithFloat:1.990f];
	[prices addObject:nineNine];		
	[prices addObject:nineNine];
    [prices addObject:nineNine];
    [prices addObject:oneNineNine];
    
    [items setObject:prices forKey:@"prices"];
    [items setObject:names forKey:@"names"];
}

-(IBAction) goBack:(id)sender
{
    NSLog(@"trying to go back");
    [self performSegueWithIdentifier:@"backToHome" sender: self];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
