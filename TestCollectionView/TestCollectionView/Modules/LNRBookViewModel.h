//
//  LNRBookViewModel.h
//  TestCollectionView
//
//  Created by Hepburn on 2019/1/15.
//  Copyright © 2019 Hepburn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNRBookModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNRBookViewModel : NSObject

@property (nonatomic, readonly) NSArray<LNRBookModel *> *models;

@end

NS_ASSUME_NONNULL_END
