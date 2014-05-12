//
//  WebApiSample.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/12.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "WebApiSample.h"

@implementation WebApiSample

- (void) fechApi {
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:@"http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8ac00925df0f7d8c&large_area=Z011&format=json"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    _receivedData = [NSMutableData dataWithCapacity:0];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    if (!urlConnection) {
        _receivedData = nil;
    }
}

// リクエスト毎にdelegateへ通知されるconnection:willSendRequest:redirectResponse: メソッドでリダイレクトの制御（特定URLのリダイレクトを許可しない、等）が行える。
// このメソッドは通信の度に通知され、最初の通信ではredirectResponseがnil、リダイレクト時にはオブジェクトが渡される。
// 通信を許可しない場合はnilを返す。
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
    LOG(@"willSendRequest");
    return request;
}
// レスポンス取得時に通知（ヘッダー情報のみ、コンテンツは含まれない）
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    LOG(@"didReceiveResponse");
    [_receivedData setLength:0];
}
// コンテンツデータのパケット？フレーム？単位の受信で断続的に通知
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    LOG(@"didReceiveData");
    [_receivedData appendData:data];
}
// データの受信が完全に終わった際に呼び出される
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    LOG(@"connectionDidFinishLoading");
    LOG(@"data: \n%@", [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding]);
}
// エラー発生時
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    LOG(@"WebAPIリクエスト中にエラー発生");
    LOG(@"%d", error.code);
    LOG(@"%@", error.domain);
    LOG(@"%@", error.userInfo.description);
}

//- (NSInputStream *)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request {
//    return nil;
//}
//- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
// totalBytesWritten:(NSInteger)totalBytesWritten
//totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
//    LOG(@"didSendBodyData");
//}
//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
//    LOG(@"willCacheResponse");
//    return cachedResponse;
//}
//- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection {
//    
//}
//- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
//    
//}
//- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
//    
//}
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//    
//}
//- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//    
//}
@end
