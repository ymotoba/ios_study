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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WebApiSample *webApiSample = [[WebApiSample alloc] init];
    [webApiSample fechApi];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
