//
//  PTCoreDataSampleAddPersonViewController.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTAppDelegate.h"
#import "Person.h"
#import "Address.h"

@interface PTCoreDataSampleAddPersonViewController : UIViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Person *detailItem;
@end
