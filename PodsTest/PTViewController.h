//
//  PTViewController.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/08.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTTab1ViewController.h"
#import "PTTab2ViewController.h"
#import "PTTabViewController.h"
#import "PTJsonViewController.h"
#import "PTTableSampleViewController.h"
#import "PTCoreDataSampleViewController.h"

@interface PTViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSArray *exampleTitleList;
@property UITableView *exampleListTableView;

@end
