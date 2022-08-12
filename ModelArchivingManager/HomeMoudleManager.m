//
//  HomeMoudleManager.m
//  ModelArchivingManager
//
//  Created by GRX on 2022/8/12.
//

#import "HomeMoudleManager.h"
static HomeMoudleManager *object;
@interface HomeMoudleManager ()
@property (nonatomic,strong)NSString *filepath;

@end
@implementation HomeMoudleManager
+ (HomeMoudleManager *)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"moudle_data"];
        object = [[HomeMoudleManager alloc]initWithPath:filepath];
    });
    return object;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [super allocWithZone:zone];
    });
    return object;
}

- (id)copyWithZone:(NSZone *)zone {
    return object;
}

- (instancetype)initWithPath:(NSString *)filepath
{
    if (self = [super init])
    {
        _filepath = filepath;
        [self readMoudleData];
    }
    return self;
}
- (void)readMoudleData
{
    NSString *filepath = [self filepath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filepath])
    {
        id object = [NSKeyedUnarchiver unarchiveObjectWithFile:filepath];
        _moudleArrayModel = [object isKindOfClass:[HomeModuleArrayModel class]] ? object : nil;
    }
}

-(void)setMoudleArrayModel:(HomeModuleArrayModel *)moudleArrayModel{
    _moudleArrayModel = moudleArrayModel;
    [self saveMoudleData];
}

- (void)saveMoudleData
{
    NSData *data = [NSData data];
    if (_moudleArrayModel)
    {
        data = [NSKeyedArchiver archivedDataWithRootObject:_moudleArrayModel];
    }
    [data writeToFile:[self filepath] atomically:YES];
}
@end
