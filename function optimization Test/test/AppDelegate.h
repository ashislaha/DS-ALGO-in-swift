//
//  AppDelegate.h
//  test
//
//  Created by Ashis Laha on 25/02/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

