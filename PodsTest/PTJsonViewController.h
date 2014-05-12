//
//  PTJsonViewController.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/12.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "WebApiSample.h"

@interface PTJsonViewController : UIViewController <NSURLConnectionDataDelegate>

@property (nonatomic, retain) NSMutableData *receivedData;

@end
