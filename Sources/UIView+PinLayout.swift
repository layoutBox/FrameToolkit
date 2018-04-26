//
//  UIView+PinLayout.swift
//  PinLayout
//
//  Created by Luc Dion on 2018-04-13.
//  Copyright © 2018 mcswiftlayyout.mirego.com. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit

public extension UIView {
    public var pin: FrameToolkit {
        return FrameToolkitImpl(view: self, keepTransform: true)
    }

    public var pinFrame: FrameToolkit {
        return FrameToolkitImpl(view: self, keepTransform: false)
    }

    @objc public var anchor: AnchorList {
        return AnchorListImpl(view: self)
    }

    @objc public var edge: EdgeList {
        return EdgeListImpl(view: self)
    }
}
#endif
