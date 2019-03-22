//
//  CPDAppDelegate.h
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

@import UIKit;

@interface CPDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *loginId;
@property (strong, nonatomic) NSString *klToken;
@property (assign, nonatomic) NSTimeInterval localTimeInterval;

@end
