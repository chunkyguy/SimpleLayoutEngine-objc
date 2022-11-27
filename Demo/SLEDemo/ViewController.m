//
// Created by Sidharth Juyal on 27/11/2022.
// Copyright © 2022 whackylabs. All rights reserved.
// 

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (UIColor *)randomColor
{
  CGFloat hue = ((CGFloat)arc4random() / UINT32_MAX);
  return [UIColor colorWithHue:hue saturation:.7f brightness:.8f alpha:1.f];
}

- (void)sle_viewDidAddSubviews:(CGRect)frame
{
  self.view.backgroundColor = [UIColor whiteColor];

  SLELayout *mainLayout = [SLELayout layoutWithParentFrame:frame
                                                 direction:SLELayoutDirectionColumn
                                                 alignment:SLELayoutAlignmentLeading];

  SLELayoutItem *previewLayout = [SLELayoutItem itemWithHeight:self.view.bounds.size.width];
  SLELayoutItem *toolbarLayout = [SLELayoutItem itemWithHeight:44];
  SLELayoutItem *imageContentLayout = [SLELayoutItem itemWithHeight:200.f];

  [mainLayout addItem:[SLELayoutItem flexItem]];
  [mainLayout addItem:previewLayout];
  [mainLayout addItem:[SLELayoutItem flexItem]];
  [mainLayout addItem:toolbarLayout];
  [mainLayout addItem:imageContentLayout];

  CGRect imageContentFrame = [imageContentLayout frame];
  SLELayout *imageLayout = [SLELayout layoutWithParentFrame:imageContentFrame
                                                  direction:SLELayoutDirectionRow
                                                  alignment:SLELayoutAlignmentLeading];
  CGFloat contentImgWidth = (imageContentFrame.size.width / 2.0) - 2.f;
  SLELayoutItem *startImageVwLayout = [SLELayoutItem itemWithWidth:contentImgWidth];
  SLELayoutItem *endImageVwLayout = [SLELayoutItem itemWithWidth:contentImgWidth];
  [imageLayout addItem:[SLELayoutItem flexItem]];
  [imageLayout addItem:startImageVwLayout];
  [imageLayout addItem:[SLELayoutItem flexItem]];
  [imageLayout addItem:endImageVwLayout];
  [imageLayout addItem:[SLELayoutItem flexItem]];

  UIView *previewVw = [[UIView alloc] initWithFrame:[previewLayout frame]];
  UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:[toolbarLayout frame]];
  UIImageView *startImageVw = [[UIImageView alloc] initWithFrame:[startImageVwLayout frame]];
  UIButton *startImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  startImageBtn.frame = startImageVw.frame;
  UIImageView *endImageVw = [[UIImageView alloc] initWithFrame:[endImageVwLayout frame]];
  UIButton *endImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  endImageBtn.frame = endImageVw.frame;

  UIBarButtonItem *playButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                                                              target:self
                                                                              action:nil];
  UIBarButtonItem *pauseButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause
                                                                               target:self
                                                                               action:nil];
  UIBarButtonItem *rewindButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                                target:self
                                                                                action:nil];
  UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                                 target:self
                                                                                 action:nil];
  UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil];

  [self.view addSubview:previewVw];
  [self.view addSubview:toolbar];
  [toolbar setItems:[NSArray arrayWithObjects:
                     spaceButton, rewindButton,
                     spaceButton, playButton,
                     spaceButton, pauseButton,
                     spaceButton, forwardButton,
                     spaceButton, nil]];
  [self.view addSubview:startImageVw];
  [self.view addSubview:endImageVw];
  [self.view addSubview:startImageBtn];
  [self.view addSubview:endImageBtn];

  self.view.backgroundColor = [UIColor whiteColor];
  previewVw.backgroundColor = [UIColor colorWithHue:.4f saturation:.7f brightness:.8f alpha:1.f];
  startImageVw.backgroundColor = [UIColor colorWithHue:.5f saturation:.7f brightness:.8f alpha:1.f];
  endImageVw.backgroundColor = [UIColor colorWithHue:.6f saturation:.7f brightness:.8f alpha:1.f];
}

@end
