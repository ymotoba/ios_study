//
//  PTTableSampleViewController.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/13.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellSample.h"
#import "SampleData.h"

@interface PTTableSampleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *tableDataArray;
- (UIImage*) createImageFromUIColor:(UIColor*) color;
@end
