//
//  PTAppDelegate.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/08.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData+MagicalRecord.h>

@interface PTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
