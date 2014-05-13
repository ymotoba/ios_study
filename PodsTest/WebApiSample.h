//
//  WebApiSample.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/12.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>

// apiレスポンスのdelegate
@protocol WebApiSampleConnectionDataDelegate <NSObject>

- (void)didSuccess:(NSDictionary *)response;
- (void)didFailWithError:(NSError *)error;

@end

@interface WebApiSample : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, retain) id<WebApiSampleConnectionDataDelegate> delegate;
@property (nonatomic, retain) NSMutableData *receivedData;

- (NSURLConnection *)fechApi:(id<WebApiSampleConnectionDataDelegate>) delegate;

@end

