//
//  PTJsonViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/12.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTJsonViewController.h"

@interface PTJsonViewController ()

@end

@implementation PTJsonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
    _receivedData = [NSMutableData dataWithCapacity:0];

	UIButton *startFetchButton = [[UIButton alloc] init];
    CGFloat buttonWidth = self.view.bounds.size.width - 20;
	startFetchButton.frame = CGRectMake(10, 100, buttonWidth, 40);
    [startFetchButton setTitle:@"start!" forState:UIControlStateNormal];
    [startFetchButton setTitleColor:RGB(0, 0, 0) forState:UIControlStateNormal];
    [startFetchButton setTitleColor:RGB(128, 128, 128) forState:UIControlStateHighlighted];
    [[startFetchButton layer] setCornerRadius:10.0f];
    [startFetchButton setClipsToBounds:TRUE];
    [[startFetchButton layer] setBorderColor:[RGB(0, 0, 0) CGColor]];
    [[startFetchButton layer] setBorderWidth:1.0f];
    [startFetchButton addTarget:self action:@selector(clickStartFetchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startFetchButton];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) clickStartFetchButton:(id) sender {
    _webApiSample = [[WebApiSample alloc] init];
    NSURLConnection *connection = [_webApiSample fechApi:self];
    if (!connection) {
        LOG(@"connection failed1");
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
