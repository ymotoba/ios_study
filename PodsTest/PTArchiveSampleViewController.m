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
    // アーカイブする対象の文字列入力TextField
    UITextField *archiveTargetTextField = [[UITextField alloc] init];
    archiveTargetTextField.frame = CGRectMake(MERGIN, APP_SCREEN_TOP + MERGIN, SCREEN_BOUNDS.size.width - MERGIN * 2, 40.0);
    archiveTargetTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:archiveTargetTextField];

    // アーカイブ開始ボタン
    UIButton *archiveStartButton = [[UIButton alloc] init];
    archiveStartButton.frame = CGRectMake(MERGIN, archiveTargetTextField.frame.origin.y + archiveTargetTextField.frame.size.height + MERGIN,
                                          SCREEN_BOUNDS.size.width - MERGIN * 2, 40.0);
    [archiveStartButton setTitle:@"Start Archive" forState:UIControlStateNormal];
    [archiveStartButton.titleLabel setFont:APP_FONT_M];
    [archiveStartButton setTitleColor:RGB(0, 0, 0) forState:UIControlStateNormal];
    [archiveStartButton setTitleColor:RGB(200, 200, 200) forState:UIControlStateHighlighted];
    [archiveStartButton setBackgroundImage:[ImageUtil createImageFromUIColor:RGB(65, 105, 225)] forState:UIControlStateNormal];
    [self.view addSubview:archiveStartButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
