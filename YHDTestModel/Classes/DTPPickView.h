//
//  DTPPickView.h
//  DTPClient
//
//  Created by yuhu.xie1 on 2018/11/26.
//  Copyright © 2018 fan.luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DTPPickViewDatasource <NSObject>

- (NSArray<NSString *> *)pickViewLoadDataSource;

@end

@interface DTPPickView : UIView

@property (nonatomic, copy) void(^callback)(NSInteger row);
@property (nonatomic,assign) id<DTPPickViewDatasource> dataSource;

- (instancetype)initWithDataSource:(id)dataSource;

- (void)show;

- (void)hidden;

@end

NS_ASSUME_NONNULL_END
