//
// Created by Sidharth Juyal on 05/07/2022.
// Copyright © 2022 SLE. All rights reserved.
// 

#import "SLEViewController.h"
#import "SLELayout.h"

@interface SLEViewController () {
  BOOL _isSetUp;
}
@end

@implementation SLEViewController

- (void)awakeFromNib
{
  [super awakeFromNib];
  _isSetUp = NO;
}

- (void)viewDidLayoutSubviews
{
  if (!_isSetUp) {
    [self sle_viewDidAddSubviews:[self _performLayout:self.view.bounds]];
    _isSetUp = YES;
  }
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
  CGRect frame = (CGRect) { .origin = CGPointZero, .size = size};
  [self sle_viewDidUpdateSubviews:[self _performLayout:frame]];
}

- (CGRect)_performLayout:(CGRect)frame
{
  SLELayoutDirection direction = (frame.size.width > frame.size.height) ? SLELayoutDirectionRow : SLELayoutDirectionColumn;
  UIEdgeInsets insets = self.view.safeAreaInsets;
  SLELayout *layout = [SLELayout layoutWithParentFrame:frame
                                             direction:direction
                                             alignment:SLELayoutAlignmentLeading];
  UIEdgeInsets safeAreaInsets = self.view.safeAreaInsets;
  CGFloat leading = (direction == SLELayoutDirectionColumn) ? safeAreaInsets.top : safeAreaInsets.left;
  CGFloat trailing = (direction == SLELayoutDirectionColumn) ? safeAreaInsets.bottom : safeAreaInsets.right;
  SLELayoutItem* contentItem = [SLELayoutItem flexItem];
  [layout addItem:[SLELayoutItem itemWithDirection:direction value:leading]];
  [layout addItem:contentItem];
  [layout addItem:[SLELayoutItem itemWithDirection:direction value:trailing]];

  return [contentItem frame];
}

- (void)sle_viewDidAddSubviews:(CGRect)frame {}
- (void)sle_viewDidUpdateSubviews:(CGRect)frame {}
@end
