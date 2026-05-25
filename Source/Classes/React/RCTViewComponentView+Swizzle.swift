//
//  RCTViewComponentView+Swizzle.swift
//  
//
//  Created by Kabbi Kumar on 25/05/26.
//

//  Fabric equivalent of RCTView+Swizzle.swift.
//
  
import Foundation
import NowYouSeeMe
    
/**
 Swizzles methods on RCTViewComponentView. lazy var so that it is called only once.
 - init(frame:)
*/
let swizzleRCTViewComponentViewForTracking: Void = {
    RCTViewComponentView.swizzleMethod(
        originalSelector: #selector(RCTViewComponentView.init(frame:)),
        swizzledSelector: #selector(RCTViewComponentView.init(componentViewTrackingFrame:))
    )
}()
  
extension RCTViewComponentView {
    fileprivate class func swizzleMethod(originalSelector: Selector, swizzledSelector: Selector) {
        guard
            let originalMethod = class_getInstanceMethod(Self.self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(Self.self, swizzledSelector)
        else {
            return
        }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
                     
    @objc dynamic fileprivate convenience init(componentViewTrackingFrame frame: CGRect) {
        // call original implementation
        self.init(componentViewTrackingFrame: frame)

        /**
         Each RCTViewComponentView should be tracked.
         Mirrors what RCTView+Swizzle does for Paper's RCTView.
        */
        trackView()
    }
}
