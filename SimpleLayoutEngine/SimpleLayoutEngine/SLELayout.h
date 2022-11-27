// Copyright © 2020 SLE. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SLELayoutItem.h"
#import "SLELayoutDirection.h"
#import "SLELayoutAlignment.h"

@interface SLELayout : NSObject
+ (instancetype)layoutWithParentFrame:(CGRect)frame
                             direction:(SLELayoutDirection)direction
                             alignment:(SLELayoutAlignment)alignment;

- (void)addItem:(SLELayoutItem *)item;
- (CGRect)frameAtIndex:(NSInteger)index;
- (NSInteger)totalItems;
@end


