//
//  RCTScrollViewComponentView+Swizzle.swift
//  
//
//  Created by Kabbi Kumar on 25/05/26.
//

//  Fabric equivalent of RCTScrollView+Swizzle.swift.
 
import Foundation
import NowYouSeeMe
                  
/**
 Swizzles methods on RCTScrollViewComponentView. lazy var so that it is called only once.
 - init(frame:)
*/
let swizzleRCTScrollViewComponentViewForTracking: Void = {
    RCTScrollViewComponentView.swizzleScrollMethod(
        originalSelector: #selector(RCTScrollViewComponentView.init(frame:)),
        swizzledSelector: #selector(RCTScrollViewComponentView.init(scrollComponentViewTrackingFrame:))
    )
}()

extension RCTScrollViewComponentView {
    fileprivate class func swizzleScrollMethod(originalSelector: Selector, swizzledSelector: Selector) {
        guard
            let originalMethod = class_getInstanceMethod(Self.self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(Self.self, swizzledSelector)
        else {
            return
        }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
                                       
    @objc dynamic fileprivate convenience init(scrollComponentViewTrackingFrame frame: CGRect) {
        // call original implementation
        self.init(scrollComponentViewTrackingFrame: frame)
            
        /**
         The inner UIScrollView of each RCTScrollViewComponentView should be tracked,
         so that children are tracked on scroll.
         Mirrors what RCTScrollView+Swizzle does for Paper's RCTScrollView.
        */
        self.trackView()
        scrollView.trackView()
    }
}
