//
//  WebApiSample.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/12.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "WebApiSample.h"

@implementation WebApiSample

+ (NSURLConnection *)fechApi:(id <NSURLConnectionDataDelegate>) delegateClass {
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:
	                            [NSURL URLWithString:@"http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8ac00925df0f7d8c&large_area=Z011&format=json"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:delegateClass];
	return connection;
}

@end
