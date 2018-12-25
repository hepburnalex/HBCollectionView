//
//  HBBaseCollectionModel.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "HBBaseCollectionModel.h"

@implementation HBBaseCollectionModel

- (id)init {
    self = [super init];
    if (self) {
        self.modelList = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

@end
