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
	// table data setting
	_tableDataArray = [NSMutableArray array];
	for (int i = 0; i < 20; i++) {
		SampleData *sampleData = [[SampleData alloc] init];
		sampleData.imageUrl = @"http://imgfp.hotp.jp/IMGH/71/33/P019187133/P019187133_168.jpg";
		sampleData.label = [NSString stringWithFormat:@"ラベルラベル%d", i];
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

- (void)didReceiveMemoryWarning {
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
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	// WebImage
	[cell.webImageView setImageWithURL:[cellItem imageUrl2NSURL] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	// ラベル
	[cell.text1 setText:cellItem.label];
	// sizeToFitしてしまうと最初の幅で固定になるようなので、1回ずつframeを算出する
	NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:14.0f] };
	CGRect textRect = [cellItem.label boundingRectWithSize:CGSizeMake(cell.text1.frame.size.width, MAXFLOAT)
	                                               options:NSStringDrawingUsesFontLeading
	                                            attributes:attributes context:nil];
	// textRectのx,yは0,0なので、ここでx,yを再設定
	textRect.origin.x = cell.text1.frame.origin.x;
	textRect.origin.y = cell.text1.frame.origin.y;
	cell.text1.frame = textRect;
	// 背景
//    UIImage *(^createImageFromUIColor)(UIColor *) = ^(UIColor *color)
//    {
//        CGRect rect = CGRectMake(0, 0, 1, 1);
//        UIGraphicsBeginImageContext(rect.size);
//        CGContextRef contextRef = UIGraphicsGetCurrentContext();
//        CGContextSetFillColorWithColor(contextRef, [color CGColor]);
//        CGContextFillRect(contextRef, rect);
//        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        return img;
//    };
	[cell.backgroundButton setBackgroundImage:[self createImageFromUIColor:RGB(200, 200, 200)] forState:UIControlStateHighlighted];

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
//	int index = [indexPath indexAtPosition:[indexPath length] - 1];
//    SampleData *cellItem = [_tableDataArray objectAtIndex:index];
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]};
//    CGRect textRect = [cellItem.labe boundingRectWithSize:CGSizeMake(SCREEN_BOUNDS.size.width - 20 - 80, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:attributes context:nil];
	// 本当は上記で得られるサイズを元に動的に高さを変える必要があるけど、練習なので固定
	return 100;
}

// UIColorからUIImageを生成
- (UIImage *)createImageFromUIColor:(UIColor *)color {
	CGRect rect = CGRectMake(0, 0, 1, 1);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(contextRef, [color CGColor]);
	CGContextFillRect(contextRef, rect);
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return img;
}

@end
