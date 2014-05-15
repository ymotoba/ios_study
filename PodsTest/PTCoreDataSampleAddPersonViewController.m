//
//  PTCoreDataSampleAddPersonViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTCoreDataSampleAddPersonViewController.h"

@interface PTCoreDataSampleAddPersonViewController ()
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *zipCodeLabel;
@property (nonatomic, retain) UILabel *stateLabel;
@property (nonatomic, retain) UILabel *cityLabel;
@property (nonatomic, retain) UILabel *otherLabel;
@property (nonatomic, retain) UITextField *nameTextField;
@property (nonatomic, retain) UITextField *zipCodeTextField;
@property (nonatomic, retain) UITextField *stateTextField;
@property (nonatomic, retain) UITextField *cityTextField;
@property (nonatomic, retain) UITextField *otherTextField;
@end

static const CGFloat kMergin = 10.0;
static const CGFloat kCommonHeight = 40.0;
CGFloat labelWidth;
CGFloat inputWidth;
CGFloat inputStartX;

@implementation PTCoreDataSampleAddPersonViewController

@synthesize detailItem = _detailItem;

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
    LOG(@"%f", SCREEN_BOUNDS.size.width);
    labelWidth = 100.0;
    inputWidth = 190.0;
    inputStartX = kMergin + labelWidth + kMergin;

    [self setupNameLayout];
    [self setupNameInputLayout];
    [self setupZipCodeLayout];
    [self setupZipCodeInputLayout];
    [self setupStateLayout];
    [self setupStateInputLayout];
    [self setupCityLayout];
    [self setupCityInputLayout];
    [self setupOtherLayout];
    [self setupOtherInputLayout];
    [self setupCompleteButton];
    [self configureView];
}

- (void) setupLabelAttributes:(UILabel*) setupTargetLabel {
    [setupTargetLabel setFont:APP_FONT_M];
    [setupTargetLabel setTextColor:RGB(32, 32, 32)];
    setupTargetLabel.textAlignment = NSTextAlignmentRight;
}

- (void) setupTextFieldAttributes:(UITextField*) setupTargetTextField {
    [setupTargetTextField layer].borderColor = RGB(224, 224, 224).CGColor;
    [setupTargetTextField layer].borderWidth = 0.5;
    [setupTargetTextField layer].cornerRadius = 2.0;
}

- (void) setupNameLayout {
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.frame = CGRectMake(kMergin, APP_SCREEN_TOP + kMergin, labelWidth, kCommonHeight);
    [self setupLabelAttributes:_nameLabel];
    _nameLabel.text = @"名前";
    [self.view addSubview:_nameLabel];
}

- (void) setupZipCodeLayout {
    _zipCodeLabel = [[UILabel alloc] init];
    _zipCodeLabel.frame = CGRectMake(kMergin, _nameLabel.bottom + kMergin, labelWidth, kCommonHeight);
    [self setupLabelAttributes:_zipCodeLabel];
    _zipCodeLabel.text = @"郵便番号";
    [self.view addSubview:_zipCodeLabel];
}

- (void) setupStateLayout {
    _stateLabel = [[UILabel alloc] init];
    _stateLabel.frame = CGRectMake(kMergin, _zipCodeLabel.bottom + kMergin, labelWidth, kCommonHeight);
    [self setupLabelAttributes:_stateLabel];
    _stateLabel.text = @"都道府県";
    [self.view addSubview:_stateLabel];
}

- (void) setupCityLayout {
    _cityLabel = [[UILabel alloc] init];
    _cityLabel.frame = CGRectMake(kMergin, _stateLabel.bottom + kMergin, labelWidth, kCommonHeight);
    [self setupLabelAttributes:_cityLabel];
    _cityLabel.text = @"市区町村";
    [self.view addSubview:_cityLabel];
}

- (void) setupOtherLayout {
    _otherLabel = [[UILabel alloc] init];
    _otherLabel.frame = CGRectMake(kMergin, _cityLabel.bottom + kMergin, labelWidth, kCommonHeight);
    [self setupLabelAttributes:_otherLabel];
    _otherLabel.text = @"町名番地";
    [self.view addSubview:_otherLabel];
}

- (void) setupNameInputLayout {
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(_nameLabel.right + kMergin, _nameLabel.frame.origin.y, inputWidth, kCommonHeight);
    [self setupTextFieldAttributes:_nameTextField];
    [self.view addSubview:_nameTextField];
}

- (void) setupZipCodeInputLayout {
    _zipCodeTextField = [[UITextField alloc] init];
    _zipCodeTextField.frame = CGRectMake(_zipCodeLabel.right + kMergin, _nameTextField.bottom + kMergin, inputWidth, kCommonHeight);
    [self setupTextFieldAttributes:_zipCodeTextField];
    [self.view addSubview:_zipCodeTextField];
}

- (void) setupStateInputLayout {
    _stateTextField = [[UITextField alloc] init];
    _stateTextField.frame = CGRectMake(_stateLabel.right + kMergin, _zipCodeTextField.bottom + kMergin, inputWidth, kCommonHeight);
    [self setupTextFieldAttributes:_stateTextField];
    [self.view addSubview:_stateTextField];
}

- (void) setupCityInputLayout {
    _cityTextField = [[UITextField alloc] init];
    _cityTextField.frame = CGRectMake(_cityLabel.right + kMergin, _stateTextField.bottom + kMergin, inputWidth, kCommonHeight);
    [self setupTextFieldAttributes:_cityTextField];
    [self.view addSubview:_cityTextField];
}

- (void) setupOtherInputLayout {
    _otherTextField = [[UITextField alloc] init];
    _otherTextField.frame = CGRectMake(_otherLabel.right + kMergin, _cityTextField.bottom + kMergin, inputWidth, kCommonHeight);
    [self setupTextFieldAttributes:_otherTextField];
    [self.view addSubview:_otherTextField];
}

- (void) setupCompleteButton {
    UIBarButtonItem *addPersonBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完了" style:UIBarButtonItemStyleDone target:self action:@selector(completeButtonTapped:)];
    self.navigationItem.rightBarButtonItem = addPersonBarButtonItem;
}

- (Person *)detailItem {
    PTAppDelegate *appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    if (!_detailItem) {
        _detailItem = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Person class])
                                                    inManagedObjectContext:self.managedObjectContext];
        _detailItem.address = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Address class])
                                                            inManagedObjectContext:self.managedObjectContext];
    }
    return _detailItem;
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    [self becomeFirstResponder];
    if (self.detailItem) {
        _nameTextField.text = self.detailItem.name;
        _zipCodeTextField.text = self.detailItem.address.zipCode;
        _stateTextField.text = self.detailItem.address.state;
        _cityTextField.text = self.detailItem.address.city;
        _otherTextField.text = self.detailItem.address.other;
    }
}

- (void) completeButtonTapped:(id) sender {
    self.detailItem.name = _nameTextField.text;
    self.detailItem.address.zipCode = _zipCodeTextField.text;
    self.detailItem.address.state = _stateTextField.text;
    self.detailItem.address.city = _cityTextField.text;
    self.detailItem.address.other = _otherTextField.text;
    // context は NSManagedObjectContext クラスのインスタンス
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
