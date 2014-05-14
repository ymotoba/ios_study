//
//  Address.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Address : NSManagedObject

@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *other;

@end
