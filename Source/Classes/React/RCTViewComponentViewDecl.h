//
//  RCTViewComponentViewDecl.h
//  
//
//  Created by Kabbi Kumar on 25/05/26.
//

//  Exposes RCTViewComponentView to Swift without requiring C++ Fabric headers.
//  The bridging header is compiled as ObjC (not C++), so it cannot include
//  RCTViewComponentView.h directly.
//
//  - .mm files  (ObjC++): __cplusplus defined -> real RCTViewComponentView header
//  - Bridging header / Swift (ObjC): __cplusplus undefined -> forward declaration only
//
//  RCTViewComponentView IS a UIView subclass, so the declaration is
//  compatible at runtime.
//
 #import <UIKit/UIKit.h>
   
 #ifdef __cplusplus
 #import <React/RCTViewComponentView.h>
 #else
 @interface RCTViewComponentView : UIView
 @end
 #endif
