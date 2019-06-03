//
//  LNRBookViewModel.m
//  TestCollectionView
//
//  Created by Hepburn on 2019/1/15.
//  Copyright © 2019 Hepburn. All rights reserved.
//

#import "LNRBookViewModel.h"

@implementation LNRBookViewModel

- (NSArray *)models {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 6; i ++) {
        LNRBookModel *tmpmodel = [[LNRBookModel alloc] init];
        tmpmodel.title = @"神笔马良";
        tmpmodel.introduce = @"很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前很久很久以前";
        tmpmodel.imagename = @"mybook01";
        [array addObject:tmpmodel];
    }
    return array;
}

@end
