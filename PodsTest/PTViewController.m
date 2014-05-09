//
//  PTViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/08.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTViewController.h"
#import <UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface PTViewController ()

@end

@implementation PTViewController

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
    self.navigationItem.title = @"test";
    [self setupExampleTitleList];
    [self setExampleTableView];
}

#pragma mark - My List

// テーブルビューに表示するリスト登録
- (void) setupExampleTitleList
{
    _exampleTitleList = @[@"SDWebImageView", @"Tab", @"JSON", @"XML", @"json2table", @"navigation", @"coredata"];
}

- (void) setExampleTableView
{
    // 初期化
    _exampleListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          APP_SCREEN_BOUNDS.size.width,
                                                                          APP_SCREEN_BOUNDS.size.height - STATUS_BAR_HEIGHT)
                                                         style:UITableViewStylePlain];
    // デリゲート指定
    _exampleListTableView.delegate = self;
    // データ・ソース指定
    _exampleListTableView.dataSource = self;
    // 背景色指定
    _exampleListTableView.backgroundColor = [UIColor whiteColor];
    // ボーダーライン無し
    _exampleListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // オフセット無し
    _exampleListTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // IDを指定
    [_exampleListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    // ビューに追加
    [self.view addSubview:_exampleListTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// セル内容の定義
- (void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    // インデックス保持
    int index = [indexPath indexAtPosition:[indexPath length] - 1];

    // セルのタイトル指定
    cell.textLabel.text = [_exampleTitleList objectAtIndex:index];
    cell.textLabel.textColor = RGBA(0.4f, 0.4f, 0.4f, 1.0f);
    cell.textLabel.font = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    // セルのボーダーライン配置（既定のだと左端に余白が出来てしまうため）
    UIView *borderline = [[UIView alloc] initWithFrame:CGRectMake(0, 59, 320, 1)];
    borderline.backgroundColor = RGBA(0.9f, 0.9f, 0.9f, 1.0f);
    [cell.contentView addSubview:borderline];
    
    // ここに画像やラベルを配置しカスタマイズできます
}
// セルの定義
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // インデックス保持
    int index = [indexPath indexAtPosition:[indexPath length] - 1];
    
    // セルのユニークID登録
    NSString *CellIdentifier = [_exampleTitleList objectAtIndex:index];
    
    // セル初期化
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        // セルの背景指定
        UIView *cellBackgroundView = [[UIView alloc] init];
        cellBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.backgroundView = cellBackgroundView;
        
        // セルの選択時の背景指定
        UIView *cellSelectedBackgroundView = [[UIView alloc] init];
        cellSelectedBackgroundView.backgroundColor = RGBA(0.95f, 0.95f, 0.95f, 1.0f);
        cell.selectedBackgroundView = cellSelectedBackgroundView;
        
        // セルの右側に矢印アイコンを表示
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // セル内容更新
        [self updateCell:cell atIndexPath:indexPath];
    }
    return cell;
}
// セルの数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_exampleTitleList count];
}

// セルのセクション数を設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// セル高さを設定
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
/*  -q2q nnnn
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
