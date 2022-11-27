//
// Created by Sidharth Juyal on 05/07/2022.
// Copyright © 2022 SLE. All rights reserved.
// 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLEViewController : UIViewController
// called after first layout pass
// add any subviews
- (void)sle_viewDidAddSubviews:(CGRect)frame;

// called after a layout change is triggered
// update subviews
- (void)sle_viewDidUpdateSubviews:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
