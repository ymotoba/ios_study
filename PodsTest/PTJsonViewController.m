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
    WebApiSample* webApiSample = [[WebApiSample alloc] init];
    NSURLConnection *connection = [webApiSample fechApi:self];
    if (!connection) {
        LOG(@"connection failed1");
    }
}

- (void)didSuccess:(NSDictionary *)response {
    LOG(@"didSuccess!");
    [[response objectForKey:@"results"] objectForKey:@"results_start"];

    // mapper
    DCArrayMapping *mapper = [DCArrayMapping mapperForClassElements:[Shop class] forAttribute:@"shop" onClass:[Results class]];
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    [config addArrayMapper:mapper];

    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass: [Gourmet class] andConfiguration:config];
    Gourmet *gourmet = [parser parseDictionary:response];
    NSLog(@"%@", gourmet.results.resultsStart);
    NSLog(@"%@", gourmet.results.resultsReturned);
    Shop *shop = ((Shop*)[gourmet.results.shop objectAtIndex:0]);
    NSLog(@"%@", shop.nameKana);
    NSLog(@"%@", shop.photo.pc.l);
}
- (void)didFailWithError:(NSError *)error {
    LOG(@"didFailWithError!");
}

@end
