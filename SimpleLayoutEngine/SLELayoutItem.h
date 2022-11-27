// Copyright © 2020 SLE. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SLELayoutDirection.h"

@interface SLELayoutItem : NSObject

+ (instancetype)flexItem;
+ (instancetype)itemWithSize:(CGSize)size;
+ (instancetype)itemWithWidth:(CGFloat)width;
+ (instancetype)itemWithHeight:(CGFloat)height;
+ (instancetype)itemWithDirection:(SLELayoutDirection)direction value:(CGFloat)value;

@property (nonatomic, readonly) CGRect frame;

@end


