//
//  CPDAppDelegate.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CPDAppDelegate.h"

@implementation CPDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSString *configParamsPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"configuration.plist"];
    if([[NSFileManager defaultManager] fileExistsAtPath:configParamsPath]){
        NSDictionary *configDic = [NSKeyedUnarchiver unarchiveObjectWithFile:configParamsPath];
        self.klToken = configDic[@"token"];
        self.loginId = configDic[@"loginId"];
        self.localTimeInterval = [configDic[@"localTimeInterval"] longLongValue];
    }
    
    return YES;
}

- (NSDictionary *)getParamsWithUrlString:(NSString *)urlString {
    NSMutableDictionary *resultDic = [NSMutableDictionary new];
    
    NSString *valueString = [[urlString componentsSeparatedByString:@"/"] lastObject];
    
    NSArray *array = [valueString componentsSeparatedByString:@"&"];
    for(NSString *string in array){
        NSString *keyString = [string componentsSeparatedByString:@"="][0];
        NSString *valueString = [string componentsSeparatedByString:@"="].count > 1 ? [string componentsSeparatedByString:@"="][1] : @"";
        [resultDic setValue:valueString forKey:keyString];
    }
    
    return resultDic.copy;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"%@",url.absoluteString);
    NSDictionary *paramDic = [self getParamsWithUrlString:url.absoluteString];
    
    self.klToken = paramDic[@"token"];
    self.loginId = paramDic[@"loginId"];
    self.localTimeInterval = [paramDic[@"localTimeInterval"] longLongValue];
    
    if(paramDic){
        NSString *configParamsPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"configuration.plist"];
        if([[NSFileManager defaultManager] fileExistsAtPath:configParamsPath]){
            [[NSFileManager defaultManager] removeItemAtPath:configParamsPath error:nil];
        }
        
        [NSKeyedArchiver archiveRootObject:paramDic toFile:configParamsPath];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
