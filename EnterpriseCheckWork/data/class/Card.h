#import "_Card.h"
#import "InterCard.h"
#import "KHHTransformation.h"

@interface Card : _Card {}
// Custom logic goes here.


+ (id)cardByID:(NSNumber *)ID modelType:(KHHCardModelType)type;

// 名片的默认排序规则
+ (NSArray *)defaultSortDescriptors;
@end

@interface Card (Type_And_Name)
- (NSString *)nameForServer;
+ (NSString *)ServerNameForCardModelType:(KHHCardModelType)type;
+ (KHHCardModelType)CardModelTypeForServerName:(NSString *)name;
+ (NSString *)EntityNameForCardModelType:(KHHCardModelType)cardType;//出错返回nil。
@end

@interface Card (KHHTransformation) <KHHTransformation>
+ (id)processIObject:(InterCard *)iObj;
- (id)updateWithIObject:(InterCard *)iObj;
@end
