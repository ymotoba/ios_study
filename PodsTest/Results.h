//
//  Results.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/13.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shop.h"

@interface Results : NSObject
@property (nonatomic, strong) NSNumber *resultsStart;
@property (nonatomic, strong) NSNumber *resultsReturned;
@property (nonatomic, strong) NSArray *shop;
@end
