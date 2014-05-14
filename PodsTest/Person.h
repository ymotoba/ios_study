//
//  Person.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Address.h"

@interface Person : NSManagedObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Address * address;

@end
