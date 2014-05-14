//
//  ArchiveSampleModel.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "ArchiveSampleModel.h"

@implementation ArchiveSampleModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_text0 forKey:@"text0"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _text0 = [aDecoder decodeObjectForKey:@"text0"];
    }
    return self;
}

@end
