//
//  RCTScrollViewComponentViewDecl.h
//  
//
//  Created by Kabbi Kumar on 25/05/26.
//
//
//  Exposes RCTScrollViewComponentView to Swift without requiring C++ Fabric headers.
//  Same pattern as RCTViewComponentViewDecl.h.
//
#import <UIKit/UIKit.h>
#ifdef __cplusplus
#import <React/RCTScrollViewComponentView.h>
#else
@interface RCTScrollViewComponentView : UIView
@property (nonatomic, readonly) UIScrollView *scrollView;
@end
#endif
