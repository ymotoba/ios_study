//
//  PTJson2TableViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/21.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTJson2TableViewController.h"

@interface PTJson2TableViewController ()

@end

@implementation PTJson2TableViewController

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
    WebApiSample *webApiSample = [[WebApiSample alloc] init];
    NSURLConnection *urlConnection = [webApiSample fechApi:self];
    if (!urlConnection) {
        // TODO リトライボタン出す
    }
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)didSuccess:(NSDictionary *)response {
    
}

- (void)didFailWithError:(NSError *)error {
}

@end
