//
//  RCTViewComponentViewDecl.h
//  
//
//  Created by Kabbi Kumar on 25/05/26.
//
//  WHY THIS FILE EXISTS
//  ────────────────────
//  RCTViewComponentView.h transitively includes C++ Fabric headers
//  (react/renderer/...). Swift cannot parse C++ — importing the real header
//  in the bridging header causes a build failure.
//
//  This file acts as a firewall:
//    __cplusplus defined (.mm files)  → import the real header; full API available
//    __cplusplus undefined (Swift)    → see only a plain ObjC declaration; no C++
//
//  The #else declaration is intentionally minimal — only the properties Swift
//  actually needs are declared. At runtime both paths resolve to the same class,
//  so there is no ABI mismatch.
//
 #import <UIKit/UIKit.h>
   
 #ifdef __cplusplus
 #import <React/RCTViewComponentView.h>
 #else
 @interface RCTViewComponentView : UIView
 @end
 #endif
