//
//  PTMagicalRecordSampleViewController.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/16.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "PTMagicalRecordSampleViewController.h"

@interface PTMagicalRecordSampleViewController ()

@end

@implementation PTMagicalRecordSampleViewController

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
//	[Person MR_truncateAll];
	LOG(@"person count is %d.", [Person MR_countOfEntities]);
	// select
	Person *savedPerson = [Person MR_findFirstByAttribute:@"name" withValue:@"name test"];
	if (!savedPerson) {
        [self insertPerson];
	}
	else {
        LOG(@"%@", savedPerson.address.zipCode);
		// delete
		BOOL deleteResult = [savedPerson MR_deleteEntity];
		LOG(@"delete result is %d.", deleteResult);
		// insert
        [self insertPerson];
	}
	LOG(@"person count is %d.", [Person MR_countOfEntities]);
}

- (void)insertPerson {
    Person *person = [Person MR_createEntity];
    person.address = [Address MR_createEntity];
    person.name = @"name test";
    NSDate *datetime = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    person.address.zipCode = [fmt stringFromDate:datetime];
    person.address.state = @"state";
    person.address.city = @"city";
    person.address.other = @"other";
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
