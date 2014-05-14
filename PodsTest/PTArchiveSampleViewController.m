//
//  PTArchiveSampleViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTArchiveSampleViewController.h"

@interface PTArchiveSampleViewController ()

@end

static const CGFloat MERGIN = 10.0;

@implementation PTArchiveSampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// アーカイブする対象の文字列入力TextField
	_archiveTargetTextField = [[UITextField alloc] init];
	_archiveTargetTextField.frame = CGRectMake(MERGIN, APP_SCREEN_TOP + MERGIN, SCREEN_BOUNDS.size.width - MERGIN * 2, 40.0);
	_archiveTargetTextField.borderStyle = UITextBorderStyleRoundedRect;
	[self.view addSubview:_archiveTargetTextField];

	// アーカイブ開始ボタン
	UIButton *archiveStartButton = [[UIButton alloc] init];
	archiveStartButton.frame = CGRectMake(MERGIN, _archiveTargetTextField.frame.origin.y + _archiveTargetTextField.frame.size.height + MERGIN,
	                                      SCREEN_BOUNDS.size.width - MERGIN * 2, 40.0);
	[archiveStartButton setTitle:@"Start Archive" forState:UIControlStateNormal];
	[archiveStartButton.titleLabel setFont:APP_FONT_M];
	[archiveStartButton setTitleColor:RGB(0, 0, 0) forState:UIControlStateNormal];
	[archiveStartButton setTitleColor:RGB(200, 200, 200) forState:UIControlStateHighlighted];
	[archiveStartButton setBackgroundImage:[ImageUtil createImageFromUIColor:RGB(65, 105, 225)] forState:UIControlStateNormal];
	[archiveStartButton addTarget:self action:@selector(archiveStartTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:archiveStartButton];

    // 前回保存したarchiveの情報があればTextFieldに表示する
    ArchiveSampleModel *savedArchiveData = [self readArchiveData];
    if (savedArchiveData) {
        [_archiveTargetTextField setText:savedArchiveData.text0];
    }
}

- (NSString*)generateArchiveFilePath {
	NSString *archiveTargetClassName = NSStringFromClass([ArchiveSampleModel class]);
	return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.dat", archiveTargetClassName]];
}

- (ArchiveSampleModel*)readArchiveData {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self generateArchiveFilePath]];
}

- (void)archiveStartTapped:(id)sender {
	ArchiveSampleModel *archiveSampleModel = [[ArchiveSampleModel alloc] init];
	archiveSampleModel.text0 = [_archiveTargetTextField text];
	BOOL saveResult = [NSKeyedArchiver archiveRootObject:archiveSampleModel toFile:[self generateArchiveFilePath]];
    if (saveResult) {
        LOG(@"save success");
    } else {
        LOG(@"save fail");
    }
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
