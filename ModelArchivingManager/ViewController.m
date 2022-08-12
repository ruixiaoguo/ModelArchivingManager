//
//  ViewController.m
//  ModelArchivingManager
//
//  Created by GRX on 2022/8/12.
//

#import "ViewController.h"
#import "HomeModuleArrayModel.h"
#import "HomeMoudleManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeModuleArrayModel *arrayMode = [[HomeModuleArrayModel alloc]init];
    /** 官方排序 */
    NSMutableArray *moduleArray = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<3; i++) {
        HomeModuleModel *model = [[HomeModuleModel alloc]init];
        model.code = [NSString stringWithFormat:@"%d",i];
        [moduleArray addObject:model];
    }
    /** 原创排序 */
    NSMutableArray *orgModuleArray = [NSMutableArray arrayWithCapacity:0];
    for (int i=10; i<13; i++) {
        HomeModuleOrgModel *model = [[HomeModuleOrgModel alloc]init];
        model.code = [NSString stringWithFormat:@"%d",i];
        [orgModuleArray addObject:model];
    }
    arrayMode.moduleModels = moduleArray;
    arrayMode.moduleOrgModels = orgModuleArray;
    /** 归档 */
    HomeMoudleManager *manager = [[HomeMoudleManager alloc]init];
    manager.moudleArrayModel = arrayMode;
    /** 获取归档数据 */
    NSArray *moudleArray = manager.moudleArrayModel.moduleModels;//官方
    NSArray *moudleOrgArray = manager.moudleArrayModel.moduleOrgModels;//原创
    for (HomeModuleModel *model in moudleArray) {
        NSLog(@"官方排序==%@",model.code);
    }
    for (HomeModuleOrgModel *model in moudleOrgArray) {
        NSLog(@"原创排序==%@",model.code);
    }
}


@end
