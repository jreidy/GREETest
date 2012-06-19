//
//  GGPTestGameViewControllerViewController.m
//  GREETest
//
//  Created by Jack Reidy on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GGPTestGameViewControllerViewController.h"

@interface GGPTestGameViewControllerViewController ()

@end

@implementation GGPTestGameViewControllerViewController

@synthesize followButton, backButton, timer, timeView, timeGiven, windowView, currentSelection;

UIButton *buttonArray[24];

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
    
    timeGiven = 60;
    timeView = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
    [timeView setUserInteractionEnabled:NO];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    timeView.text = [NSString stringWithFormat:@"%i", timeGiven];
    timeView.textColor = [UIColor blackColor];
    [timeView setBackgroundColor:[UIColor clearColor]];
    [timeView setFont:[UIFont fontWithName: @"Verdana" size: 13.0f]]; 
    timeView.hidden = NO;
    [windowView addSubview:timeView];
    [self buildGrid];
    
}

-(IBAction) followTouched:(id)sender
{
    UIButton *selected = (UIButton*) sender;
    if (currentSelection == selected.tag) {
        [buttonArray[currentSelection] setImage:[UIImage imageNamed:@"noHighlight.png"] forState:UIControlStateNormal];
        currentSelection = arc4random() % 23 + 1;
        [buttonArray[currentSelection] setImage:[UIImage imageNamed:@"notSelected.png"] forState:UIControlStateNormal];
        NSLog(@"%i", currentSelection);
    } else {
        //do nothing
    }
}

-(IBAction) goBack:(id)sender
{
    NSLog(@"trying to go back");
    [self performSegueWithIdentifier:@"backToHome" sender: self];
    
}

- (void)timerFired:(NSTimer *)timer{
    if (timeGiven != 0) {
        timeGiven--;
        timeView.text = [NSString stringWithFormat:@"%i", timeGiven];
    } else {
        [self endGame];
    }
}

-(void) buildGrid
{
    int xpos = 15;
    int ypos = 10;
    for (int i = 0; i < 24; i++) {
        if (i == 0) continue;
        if (i == 6 || i == 12 || i == 18) {
            xpos = 15;
            ypos+= 75;
        } else if (i != 0) {
            xpos+=75;
        }
              
        buttonArray[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        [buttonArray[i] setImage:[UIImage imageNamed:@"noHighlight.png"] forState:UIControlStateNormal];
        [buttonArray[i] setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateHighlighted];
        [buttonArray[i] setFrame:CGRectMake(xpos, ypos, 75, 75)];
        [buttonArray[i] setTag:i];
        [buttonArray[i] addTarget:self action:@selector(followTouched:)forControlEvents:UIControlEventTouchDown];
        [windowView addSubview:buttonArray[i]];
    }
    
    currentSelection = arc4random() % 23 + 1;
    NSLog(@"%i", currentSelection);
    [buttonArray[currentSelection] setImage:[UIImage imageNamed:@"notSelected.png"] forState:UIControlStateNormal];
}

-(void) playGame
{
    
}

- (void) endGame
{
    
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
