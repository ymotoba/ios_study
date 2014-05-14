//
//  PTUserDefaultsSampleViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTUserDefaultsSampleViewController.h"

@interface PTUserDefaultsSampleViewController ()

@end

static const CGFloat kMergin = 10.0;

@implementation PTUserDefaultsSampleViewController

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
    _textField = [[UITextField alloc] init];
    _textField.frame = CGRectMake(kMergin, APP_SCREEN_TOP + kMergin, SCREEN_BOUNDS.size.width - kMergin * 2, 40.0);
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];

    UIButton *nextPageButton = [[UIButton alloc] init];
    nextPageButton.frame = CGRectMake(kMergin, _textField.frame.origin.y + _textField.frame.size.height + kMergin, SCREEN_BOUNDS.size.width - kMergin * 2, 40.0);
    nextPageButton.titleLabel.textColor = RGB(64, 64, 64);
    [nextPageButton setTitleColor:RGB(64, 64, 64) forState:UIControlStateNormal];
    [nextPageButton setTitleColor:RGB(224, 224, 224) forState:UIControlStateHighlighted];
    [nextPageButton setTitle:@"保存確認" forState:UIControlStateNormal];
    nextPageButton.titleLabel.font = APP_FONT_M;
    [[nextPageButton layer] setBorderWidth:0.5];
    [[nextPageButton layer] setBorderColor:[RGB(0, 0, 0) CGColor]];
    [[nextPageButton layer] setCornerRadius:2.5];
    [nextPageButton addTarget:self action:@selector(saveByUserDefaults:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextPageButton];
}

- (void) saveByUserDefaults:(id) sender {
    UserDefaultsSampleModel *userDefaultsSampleModel = [[UserDefaultsSampleModel alloc] init];
    userDefaultsSampleModel.text = _textField.text;
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:userDefaultsSampleModel];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:saveData forKey:NSStringFromClass([UserDefaultsSampleModel class])];
    PTReadUserDefaultsViewController *readUserDefaultsViewController = [[PTReadUserDefaultsViewController alloc] init];
    [self.navigationController pushViewController:readUserDefaultsViewController animated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
