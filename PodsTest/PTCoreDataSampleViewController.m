//
//  PTCoreDataSampleViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTCoreDataSampleViewController.h"

@interface PTCoreDataSampleViewController ()

@end

static const CGFloat kMergin = 10.0;

@implementation PTCoreDataSampleViewController

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
    // データを表示するテーブル
    UITableView *personListTableView = [[UITableView alloc] init];
    personListTableView.frame = CGRectMake(kMergin, 0, SCREEN_BOUNDS.size.width - kMergin * 2, SCREEN_BOUNDS.size.height);
    [self.view addSubview:personListTableView];
    // データ追加用ナビゲーション右ボタン
    UIBarButtonItem *addPersonBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(addPersonButtonTapped:)];
    self.navigationItem.rightBarButtonItem = addPersonBarButtonItem;
}

- (void) addPersonButtonTapped:(id) sender {
    PTCoreDataSampleAddPersonViewController *coreDataSampleAddPersonViewController = [[PTCoreDataSampleAddPersonViewController alloc] init];
    [self.navigationController pushViewController:coreDataSampleAddPersonViewController animated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
