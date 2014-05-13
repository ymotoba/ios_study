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
        [self addSubview:_webImageView];

        // label
        _text1 = [[UILabel alloc] init];
        _text1.numberOfLines = 0;
        _text1.frame = CGRectMake(_webImageView.frame.origin.x + _webImageView.frame.size.width + MERGIN,
                                  MERGIN,
                                  SCREEN_BOUNDS.size.width - 20 - _webImageView.frame.size.width,
                                  40.0);
        _text1.font = [UIFont systemFontOfSize:14.0f];
        [_text1 setTextColor:RGB(0, 0, 0)];
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

@end
