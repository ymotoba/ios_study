//
//  PTTableSampleViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/13.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTTableSampleViewController.h"

@interface PTTableSampleViewController ()

@end

@implementation PTTableSampleViewController

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
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, APP_SCREEN_BOUNDS.size.width, APP_SCREEN_BOUNDS.size.height);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
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
