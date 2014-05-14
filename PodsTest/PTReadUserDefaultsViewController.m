//
//  PTReadUserDefaultsViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTReadUserDefaultsViewController.h"

@interface PTReadUserDefaultsViewController ()

@end

static const CGFloat kMergin = 10.0;

@implementation PTReadUserDefaultsViewController

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
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(kMergin, APP_SCREEN_TOP + kMergin, SCREEN_BOUNDS.size.width - kMergin * 2, 40.0);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *savedData = [userDefaults objectForKey:NSStringFromClass([UserDefaultsSampleModel class])];
    UserDefaultsSampleModel *userDefaultsSampleModel = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
    label.text = userDefaultsSampleModel.text;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
