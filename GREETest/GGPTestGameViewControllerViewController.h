//
//  GGPTestGameViewControllerViewController.h
//  GREETest
//
//  Created by Jack Reidy on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGPTestGameViewControllerViewController : UIViewController


@property (nonatomic) IBOutlet UIButton *followButton;
@property (nonatomic) int currentSelection;
@property (nonatomic) UILabel *scoreLabel;
@property (nonatomic) UILabel *coinsLabel;
@property (nonatomic) int coins;
@property (nonatomic) int points;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) UITextView *timeView;
@property (nonatomic) int timeGiven;
@property (nonatomic) UIView *windowView;
@property (nonatomic) UIButton *backButton;

@end
