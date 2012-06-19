//
//  GGPTestAppDelegate.h
//  GREETest
//
//  Created by Jack Reidy on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GreePlatform.h"
@class GreeHelloViewController;
@interface GreeHelloAppDelegate : UIResponder 
<UIApplicationDelegate, GreeApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GreeHelloViewController *viewController;
@end

@interface GGPTestAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
