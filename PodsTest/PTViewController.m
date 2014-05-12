//
//  PTViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/08.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTViewController.h"
#import "CustomUITableViewCell.h"
#import <UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface PTViewController ()

@end

@implementation PTViewController

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
	self.navigationItem.title = @"test";
	[self setupExampleTitleList];
	[self setExampleTableView];
}

// テーブルビューに表示するリスト登録
- (void)setupExampleTitleList {
	_exampleTitleList = @[@"Tab", @"JSON", @"XML", @"json2table", @"navigation", @"coredata"];
}

- (void)setExampleTableView {
	// 初期化
	_exampleListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUNDS.size.width, SCREEN_BOUNDS.size.height) style:UITableViewStylePlain];
	LOG(@"   screen width:%f, height:%f", SCREEN_BOUNDS.size.width, SCREEN_BOUNDS.size.height);
	LOG(@"appscreen width:%f, height:%f", APP_SCREEN_BOUNDS.size.width, APP_SCREEN_BOUNDS.size.height);
	_exampleListTableView.delegate = self;
	_exampleListTableView.dataSource = self;
	_exampleListTableView.backgroundColor = [UIColor whiteColor];
	_exampleListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	_exampleListTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
	[_exampleListTableView registerClass:[CustomUITableViewCell class] forCellReuseIdentifier:@"CustomOneCell"];
	[self.view addSubview:_exampleListTableView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// セルタップ時
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = [indexPath indexAtPosition:[indexPath length] - 1];
	// 0 → Tab
	if (index == 0) {
		PTTabViewController *tabBarController = [[PTTabViewController alloc] initWithNibName:nil bundle:nil];
		PTTab1ViewController *tab1ViewController = [[PTTab1ViewController alloc] initWithNibName:nil bundle:nil];
		PTTab2ViewController *tab2ViewController = [[PTTab2ViewController alloc] initWithNibName:nil bundle:nil];
		NSArray *tabControllerArray = [NSArray arrayWithObjects:tab1ViewController, tab2ViewController, nil];
		[tabBarController setViewControllers:tabControllerArray];
		NSArray *tabItemArray = tabBarController.tabBar.items;
		[[tabItemArray objectAtIndex:0] setTitle:@"Tab1"];
		[[tabItemArray objectAtIndex:1] setTitle:@"Tab2"];
        [self.navigationController pushViewController:tabBarController animated:TRUE];
	}
}

// セルの定義
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = [indexPath indexAtPosition:[indexPath length] - 1];
	static NSString *CellIdentifier = @"CustomOneCell";
	// カスタムセルにキャスト。キャストすることによりカスタムセルのpropertyが使える
	CustomUITableViewCell *cell = (CustomUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	// セルの右側に矢印アイコンを表示
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	// セルの背景指定
	UIView *cellBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
	cellBackgroundView.backgroundColor = [UIColor whiteColor];
	cell.backgroundView = cellBackgroundView;

	// セルのタイトル指定
	cell.textLabel.text = [_exampleTitleList objectAtIndex:index];
	cell.textLabel.textColor = [UIColor grayColor];
	cell.textLabel.font = [UIFont fontWithName:@"Futura-Medium" size:16];

	// セルのボーダーライン配置（既定のだと左端に余白が出来てしまうため）
	UIView *borderline = [[UIView alloc] initWithFrame:CGRectMake(0, 59, 320, 1)];
	borderline.backgroundColor = RGBA(0.7f, 0.7f, 0.7f, 1.0f);
	[cell.contentView addSubview:borderline];

	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

// セルの数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_exampleTitleList count];
}

// セルのセクション数を設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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
