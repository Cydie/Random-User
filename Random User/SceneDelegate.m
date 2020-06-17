//
//  SceneDelegate.m
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 14..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "MasterViewController.h"
#import "PersonDetailViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

	UIWindow *window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
	
	MasterViewController *masterViewController = [[MasterViewController alloc] initWithStyle:UITableViewStylePlain];
	UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:masterViewController];
	
	UITableViewStyle tableStyle = UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone ? UITableViewStyleGrouped : UITableViewStyleInsetGrouped;
	PersonDetailViewController *detailViewController = [[PersonDetailViewController alloc] initWithStyle:tableStyle];
	UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:detailViewController];
	
	masterViewController.delegate = detailViewController;
	masterViewController.detailViewController = detailViewController;
	
	UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
	splitViewController.viewControllers = @[masterNav, detailNav];
	splitViewController.delegate = masterViewController;
	splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
	
	window.rootViewController = splitViewController;
	[window makeKeyAndVisible];
	self.window = window;
	
}


- (void)sceneDidDisconnect:(UIScene *)scene {
	// Called as the scene is being released by the system.
	// This occurs shortly after the scene enters the background, or when its session is discarded.
	// Release any resources associated with this scene that can be re-created the next time the scene connects.
	// The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
	// Called when the scene has moved from an inactive state to an active state.
	// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
	// Called when the scene will move from an active state to an inactive state.
	// This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
	// Called as the scene transitions from the background to the foreground.
	// Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
	// Called as the scene transitions from the foreground to the background.
	// Use this method to save data, release shared resources, and store enough scene-specific state information
	// to restore the scene back to its current state.
}


@end
