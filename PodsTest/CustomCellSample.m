//
//  CustomCellSample.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/13.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "CustomCellSample.h"

@implementation CustomCellSample

static const CGFloat MERGIN = 10.0;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // WebImage
        _webImageView = [[UIImageView alloc] init];
        _webImageView.frame = CGRectMake(MERGIN, MERGIN, 80.0, 80.0);

        // 背景
        _backgroundButton = [[UIButton alloc] init];
        _backgroundButton.frame = CGRectMake(MERGIN / 2, MERGIN / 2, SCREEN_BOUNDS.size.width - MERGIN, 100.0 - MERGIN);
        [[_backgroundButton layer] setCornerRadius:2.5f];
        [_backgroundButton setClipsToBounds:TRUE];
        [[_backgroundButton layer] setBorderColor:[RGB(0, 0, 0) CGColor]];
        [[_backgroundButton layer] setBorderWidth:0.5f];
        [_backgroundButton addTarget:self action:@selector(backgroundButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [_backgroundButton setBackgroundImage:[ImageUtil createImageFromUIColor:RGB(200, 200, 200)] forState:UIControlStateHighlighted];

        // label
        _text1 = [[UILabel alloc] init];
        _text1.numberOfLines = 0;
        _text1.frame = CGRectMake(_webImageView.frame.origin.x + _webImageView.frame.size.width + MERGIN,
                                  MERGIN,
                                  SCREEN_BOUNDS.size.width - MERGIN * 2 - _webImageView.frame.size.width,
                                  40.0);
        _text1.font = [UIFont systemFontOfSize:14.0f];
        [_text1 setTextColor:RGB(0, 0, 0)];

        [self addSubview:_backgroundButton];
        [self addSubview:_webImageView];
        [self addSubview:_text1];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) backgroundButtonTapped:(id) sender {
    LOG(@"test");
}
@end
