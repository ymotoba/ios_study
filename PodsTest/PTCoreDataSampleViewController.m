//
//  PTCoreDataSampleViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTCoreDataSampleViewController.h"

@interface PTCoreDataSampleViewController ()
@property NSArray *personFetchResults;
@end

static NSString *kCellId = @"cellid";
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
	personListTableView.delegate = self;
	personListTableView.dataSource = self;
	personListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[personListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellId];

    [self.view addSubview:personListTableView];
    // データ追加用ナビゲーション右ボタン
    UIBarButtonItem *addPersonBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(addPersonButtonTapped:)];
    self.navigationItem.rightBarButtonItem = addPersonBarButtonItem;



    PTAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    // データ検索
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    _personFetchResults = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
    for (int i = 0; i < _personFetchResults.count; i++) {
        Person *person = [_personFetchResults objectAtIndex:i];
        LOG(@"%@", person.name);
    }
}

- (void) addPersonButtonTapped:(id) sender {
    PTCoreDataSampleAddPersonViewController *coreDataSampleAddPersonViewController = [[PTCoreDataSampleAddPersonViewController alloc] init];
    [self.navigationController pushViewController:coreDataSampleAddPersonViewController animated:TRUE];
}

// セルの定義
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = [indexPath indexAtPosition:[indexPath length] - 1];
	Person *cellItem = [_personFetchResults objectAtIndex:index];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = cellItem.name;
	return cell;
}

// セルの数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_personFetchResults) {
        return 0;
    }
	return [_personFetchResults count];
}

// セルのセクション数を設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// セル高さを設定
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
