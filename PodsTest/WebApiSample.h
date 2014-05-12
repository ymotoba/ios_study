//
//  WebApiSample.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/12.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebApiSample : NSObject <NSURLConnectionDataDelegate>

- (NSURLConnection *)fechApi:(id <NSURLConnectionDataDelegate>) delegateClass;

@end
