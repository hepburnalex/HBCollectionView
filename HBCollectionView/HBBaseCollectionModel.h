//
//  HBBaseCollectionModel.h
//  HBCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBBaseCollectionModel : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSMutableArray *modelList;

@end

NS_ASSUME_NONNULL_END
