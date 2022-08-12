//
//  HomeMoudleManager.h
//  ModelArchivingManager
//
//  Created by GRX on 2022/8/12.
//

#import <Foundation/Foundation.h>
#import "HomeModuleArrayModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeMoudleManager : NSObject
+ (HomeMoudleManager *)share;
@property (nonatomic, strong)HomeModuleArrayModel *moudleArrayModel;
@end

NS_ASSUME_NONNULL_END
