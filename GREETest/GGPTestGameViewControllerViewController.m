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

@synthesize followButton, backButton, timer, timeView, timeGiven, windowView, currentSelection, numberVisited;

UIButton *buttonArray[20];
BOOL visitedBlocks[20];

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
    windowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BlockTapperGamePlay.png"]];
    [self.view addSubview:windowView];
    
    numberVisited = 0;
    
    for (int i=0; i<20; i++) {
        visitedBlocks[i] = false;
    }
    
    backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundColor:[UIColor yellowColor]];
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
        [buttonArray[currentSelection] setImage:[UIImage imageNamed:@"BlockX.png"] forState:UIControlStateNormal];
        visitedBlocks[currentSelection] = TRUE;
        numberVisited++;
        if (numberVisited == 20) {
            [self endGame];
        } else {
            while (visitedBlocks[currentSelection]) {
                currentSelection = arc4random() % 20;
            }
            [buttonArray[currentSelection] setImage:[UIImage imageNamed:@"BlockSelected.png"] forState:UIControlStateNormal];
            NSLog(@"%i", currentSelection);
        }
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
    int xpos = 90;
    int ypos = 10;
    for (int i = 0; i < 20; i++) {
        if (i == 5 || i == 10 || i == 15) {
            xpos = 90;
            ypos+= 75;
        } else if (i != 0) {
            xpos+=75;
        }
              
        buttonArray[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        [buttonArray[i] setImage:[UIImage imageNamed:@"BlockUnselected.png"] forState:UIControlStateNormal];
        [buttonArray[i] setImage:[UIImage imageNamed:@"BlockSelected.png"] forState:UIControlStateHighlighted];
        [buttonArray[i] setFrame:CGRectMake(xpos, ypos, 75, 75)];
        [buttonArray[i] setTag:i];
        [buttonArray[i] addTarget:self action:@selector(followTouched:)forControlEvents:UIControlEventTouchDown];
        [windowView addSubview:buttonArray[i]];
    }
    
    currentSelection = arc4random() % 20;
    NSLog(@"%i", currentSelection);
    [buttonArray[currentSelection] setImage:[UIImage imageNamed:@"BlockSelected.png"] forState:UIControlStateNormal];
}

-(void) playGame
{
    
}

- (void) endGame
{
    windowView.backgroundColor = [UIColor blackColor];
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
