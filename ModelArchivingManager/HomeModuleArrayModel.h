//
//  HomeModuleModelArray.h
//  ModelArchivingManager
//
//  Created by GRX on 2022/8/12.
//

#import "SparksCodingObject.h"

NS_ASSUME_NONNULL_BEGIN
/** 官方排序 */
@interface HomeModuleModel : SparksCodingObject
@property (nonatomic, strong)NSString *code;
@end
/** 原创排序 */
@interface HomeModuleOrgModel : SparksCodingObject
@property (nonatomic, strong)NSString *code;
@end

@interface HomeModuleArrayModel : SparksCodingObject
@property (nonatomic, strong) NSArray *moduleModels;
@property (nonatomic, strong) NSArray *moduleOrgModels;
@end

NS_ASSUME_NONNULL_END
