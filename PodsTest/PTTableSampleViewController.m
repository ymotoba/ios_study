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

#define CUSTOMCELLID @"CustomCellId"

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
    // table data setting
    _tableDataArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        SampleData *sampleData = [[SampleData alloc] init];
        sampleData.imageUrl = @"http://imgfp.hotp.jp/IMGH/71/33/P019187133/P019187133_168.jpg";
        sampleData.labe = [NSString stringWithFormat:@"ラベル%d", i];
        [_tableDataArray addObject:sampleData];
    }
    // table setting
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
	tableView.dataSource = self;
    tableView.frame = CGRectMake(0, 0, SCREEN_BOUNDS.size.width, SCREEN_BOUNDS.size.height);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[tableView registerClass:[CustomCellSample class] forCellReuseIdentifier:CUSTOMCELLID];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// セルタップ時
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

// セルの定義
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = [indexPath indexAtPosition:[indexPath length] - 1];
    SampleData *cellItem = [_tableDataArray objectAtIndex:index];
	// カスタムセルにキャスト。キャストすることによりカスタムセルのpropertyが使える
	CustomCellSample *cell = (CustomCellSample *)[tableView dequeueReusableCellWithIdentifier:CUSTOMCELLID forIndexPath:indexPath];
    // WebImage
    [cell.webImageView setImageWithURL:[cellItem imageUrl2NSURL] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // ラベル
    [cell.text1 setText:cellItem.labe];
    [cell.text1 sizeToFit];
    LOG(@"%f", cell.text1.frame.size.height);
	return cell;
}

// セルの数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_tableDataArray count];
}

// セルのセクション数を設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// セル高さを設定
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

@end
