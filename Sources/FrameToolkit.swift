//  Copyright (c) 2017 Luc Dion
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/*
 UIView's anchors point
 ======================

         topLeft      topCenter       topRight
            o-------------o--------------o
            |                            |
            |                            |
            |                            |
            |                            |
            |                            |
            |           center           |
 centerLeft o             o              o centerRight
            |                            |
            |                            |
            |                            |
            |                            |
            |                            |
            |                            |
            o-------------o--------------o
       bottomLeft    bottomCenter     bottomLeft

 */

/// UIViews's anchor definition
@objc public protocol Anchor {
}

/// UIViews's list of anchors.
@objc public protocol AnchorList {
    var topLeft: Anchor { get }
    var topCenter: Anchor { get }
    var topRight: Anchor { get }
    var centerLeft: Anchor { get }
    var center: Anchor { get }
    var centerRight: Anchor { get }
    var bottomLeft: Anchor { get }
    var bottomCenter: Anchor { get }
    var bottomRight: Anchor { get }

    // RTL support
    var topStart: Anchor { get }
    var topEnd: Anchor { get }
    var centerStart: Anchor { get }
    var centerEnd: Anchor { get }
    var bottomStart: Anchor { get }
    var bottomEnd: Anchor { get }
}

/*
 UIView's Edges
 ======================
                   top
          +-----------------+
          |                 |
          |                 |
          |     hCenter     |
     left |        +        | right
          |     vCenter     |
          |                 |
          |                 |
          +-----------------+
                  bottom
*/

/// UIViews's list of edges
@objc public protocol EdgeList {
    var top: VerticalEdge { get }
    var vCenter: VerticalEdge { get }
    var bottom: VerticalEdge { get }
    var left: HorizontalEdge { get }
    var hCenter: HorizontalEdge { get }
    var right: HorizontalEdge { get }

    // RTL support
    var start: HorizontalEdge { get }
    var end: HorizontalEdge { get }
}

/// PinLayout interface
public protocol FrameToolkit {

    #if os(iOS) || os(tvOS)
    /// Expose a compatible `safeAreaInsets` for all iOS releases (including iOS 7/8/9/10/...). Available only for >= iOS 9
    var safeArea: UIEdgeInsets { get }
    #endif

    //
    // MARK: Layout using distances from superview’s edges
    //
    @discardableResult func top() -> FrameToolkit
    @discardableResult func top(_ value: CGFloat) -> FrameToolkit
    @discardableResult func top(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func top(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func top(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    @discardableResult func left() -> FrameToolkit
    @discardableResult func left(_ value: CGFloat) -> FrameToolkit
    @discardableResult func left(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func left(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func left(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    @discardableResult func bottom() -> FrameToolkit
    @discardableResult func bottom(_ value: CGFloat) -> FrameToolkit
    @discardableResult func bottom(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func bottom(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func bottom(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    @discardableResult func right() -> FrameToolkit
    @discardableResult func right(_ value: CGFloat) -> FrameToolkit
    @discardableResult func right(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func right(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func right(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    @discardableResult func hCenter() -> FrameToolkit
    @discardableResult func hCenter(_ value: CGFloat) -> FrameToolkit
    @discardableResult func hCenter(_ percent: Percent) -> FrameToolkit

    @discardableResult func vCenter() -> FrameToolkit
    @discardableResult func vCenter(_ value: CGFloat) -> FrameToolkit
    @discardableResult func vCenter(_ percent: Percent) -> FrameToolkit

    // RTL support
    @discardableResult func start() -> FrameToolkit
    @discardableResult func start(_ value: CGFloat) -> FrameToolkit
    @discardableResult func start(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func start(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func start(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    @discardableResult func end() -> FrameToolkit
    @discardableResult func end(_ value: CGFloat) -> FrameToolkit
    @discardableResult func end(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func end(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func end(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    // Pin multiple edges at once.
    /**
     Pin all edges on its superview's corresponding edges (top, bottom, left, right).

     Similar to calling `view.top().bottom().left().right()`
     */
    @discardableResult func all() -> FrameToolkit
    @discardableResult func all(_ value: CGFloat) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func all(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func all(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    /**
     Pin the left and right edges on its superview's corresponding edges.

     Similar to calling `view.left().right()`.
     */
    @discardableResult func horizontally() -> FrameToolkit
    @discardableResult func horizontally(_ value: CGFloat) -> FrameToolkit
    @discardableResult func horizontally(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func horizontally(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func horizontally(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    /**
     Pin the **top and bottom edges** on its superview's corresponding edges.

     Similar to calling `view.top().bottom()`.
     */
    @discardableResult func vertically() -> FrameToolkit
    @discardableResult func vertically(_ value: CGFloat) -> FrameToolkit
    @discardableResult func vertically(_ percent: Percent) -> FrameToolkit
    /**
     Pin the **top and bottom edges** on its superview's corresponding edges.
     The UIEdgeInsets.top is used to pin the top edge and the UIEdgeInsets.bottom
     for the bottom edge.
     */
    #if os(iOS) || os(tvOS)
    @discardableResult func vertically(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func vertically(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    //
    // MARK: Layout using edges
    //
    @discardableResult func top(to edge: VerticalEdge) -> FrameToolkit
    @discardableResult func vCenter(to edge: VerticalEdge) -> FrameToolkit
    @discardableResult func bottom(to edge: VerticalEdge) -> FrameToolkit
    @discardableResult func left(to edge: HorizontalEdge) -> FrameToolkit
    @discardableResult func hCenter(to edge: HorizontalEdge) -> FrameToolkit
    @discardableResult func right(to edge: HorizontalEdge) -> FrameToolkit
    // RTL support
    @discardableResult func start(to edge: HorizontalEdge) -> FrameToolkit
    @discardableResult func end(to edge: HorizontalEdge) -> FrameToolkit

    //
    // MARK: Layout using anchors
    //
    @discardableResult func topLeft(to anchor: Anchor) -> FrameToolkit
    @discardableResult func topLeft() -> FrameToolkit
    @discardableResult func topStart(to anchor: Anchor) -> FrameToolkit
    @discardableResult func topStart() -> FrameToolkit

    @discardableResult func topCenter(to anchor: Anchor) -> FrameToolkit
    @discardableResult func topCenter() -> FrameToolkit

    @discardableResult func topRight(to anchor: Anchor) -> FrameToolkit
    @discardableResult func topRight() -> FrameToolkit
    @discardableResult func topEnd(to anchor: Anchor) -> FrameToolkit
    @discardableResult func topEnd() -> FrameToolkit

    @discardableResult func centerLeft(to anchor: Anchor) -> FrameToolkit
    @discardableResult func centerLeft() -> FrameToolkit
    @discardableResult func centerStart(to anchor: Anchor) -> FrameToolkit
    @discardableResult func centerStart() -> FrameToolkit

    @discardableResult func center(to anchor: Anchor) -> FrameToolkit
    @discardableResult func center() -> FrameToolkit

    @discardableResult func centerRight(to anchor: Anchor) -> FrameToolkit
    @discardableResult func centerRight() -> FrameToolkit
    @discardableResult func centerEnd(to anchor: Anchor) -> FrameToolkit
    @discardableResult func centerEnd() -> FrameToolkit

    @discardableResult func bottomLeft(to anchor: Anchor) -> FrameToolkit
    @discardableResult func bottomLeft() -> FrameToolkit
    @discardableResult func bottomStart(to anchor: Anchor) -> FrameToolkit
    @discardableResult func bottomStart() -> FrameToolkit

    @discardableResult func bottomCenter(to anchor: Anchor) -> FrameToolkit
    @discardableResult func bottomCenter() -> FrameToolkit

    @discardableResult func bottomRight(to anchor: Anchor) -> FrameToolkit
    @discardableResult func bottomRight() -> FrameToolkit
    @discardableResult func bottomEnd(to anchor: Anchor) -> FrameToolkit
    @discardableResult func bottomEnd() -> FrameToolkit

    //
    // MARK: Layout using relative positioning
    //
    #if os(iOS) || os(tvOS)
        @discardableResult func above(of: UIView) -> FrameToolkit
        @discardableResult func above(of: [UIView]) -> FrameToolkit
        @discardableResult func above(of: UIView, aligned: HorizontalAlign) -> FrameToolkit
        @discardableResult func above(of: [UIView], aligned: HorizontalAlign) -> FrameToolkit

        @discardableResult func below(of: UIView) -> FrameToolkit
        @discardableResult func below(of: [UIView]) -> FrameToolkit
        @discardableResult func below(of: UIView, aligned: HorizontalAlign) -> FrameToolkit
        @discardableResult func below(of: [UIView], aligned: HorizontalAlign) -> FrameToolkit

        @discardableResult func left(of: UIView) -> FrameToolkit
        @discardableResult func left(of: [UIView]) -> FrameToolkit
        @discardableResult func left(of: UIView, aligned: VerticalAlign) -> FrameToolkit
        @discardableResult func left(of: [UIView], aligned: VerticalAlign) -> FrameToolkit

        @discardableResult func right(of: UIView) -> FrameToolkit
        @discardableResult func right(of: [UIView]) -> FrameToolkit
        @discardableResult func right(of: UIView, aligned: VerticalAlign) -> FrameToolkit
        @discardableResult func right(of: [UIView], aligned: VerticalAlign) -> FrameToolkit

        // RTL support
        @discardableResult func before(of: UIView) -> FrameToolkit
        @discardableResult func before(of: [UIView]) -> FrameToolkit
        @discardableResult func before(of: UIView, aligned: VerticalAlign) -> FrameToolkit
        @discardableResult func before(of: [UIView], aligned: VerticalAlign) -> FrameToolkit
        @discardableResult func after(of: UIView) -> FrameToolkit
        @discardableResult func after(of: [UIView]) -> FrameToolkit
        @discardableResult func after(of: UIView, aligned: VerticalAlign) -> FrameToolkit
        @discardableResult func after(of: [UIView], aligned: VerticalAlign) -> FrameToolkit
    #elseif os(macOS)
        @discardableResult func above(of: NSView) -> PinLayout
        @discardableResult func above(of: [NSView]) -> PinLayout
        @discardableResult func above(of: NSView, aligned: HorizontalAlign) -> PinLayout
        @discardableResult func above(of: [NSView], aligned: HorizontalAlign) -> PinLayout

        @discardableResult func below(of: NSView) -> PinLayout
        @discardableResult func below(of: [NSView]) -> PinLayout
        @discardableResult func below(of: NSView, aligned: HorizontalAlign) -> PinLayout
        @discardableResult func below(of: [NSView], aligned: HorizontalAlign) -> PinLayout

        @discardableResult func left(of: NSView) -> PinLayout
        @discardableResult func left(of: [NSView]) -> PinLayout
        @discardableResult func left(of: NSView, aligned: VerticalAlign) -> PinLayout
        @discardableResult func left(of: [NSView], aligned: VerticalAlign) -> PinLayout

        @discardableResult func right(of: NSView) -> PinLayout
        @discardableResult func right(of: [NSView]) -> PinLayout
        @discardableResult func right(of: NSView, aligned: VerticalAlign) -> PinLayout
        @discardableResult func right(of: [NSView], aligned: VerticalAlign) -> PinLayout

        // RTL support
        @discardableResult func before(of: NSView) -> PinLayout
        @discardableResult func before(of: [NSView]) -> PinLayout
        @discardableResult func before(of: NSView, aligned: VerticalAlign) -> PinLayout
        @discardableResult func before(of: [NSView], aligned: VerticalAlign) -> PinLayout
        @discardableResult func after(of: NSView) -> PinLayout
        @discardableResult func after(of: [NSView]) -> PinLayout
        @discardableResult func after(of: NSView, aligned: VerticalAlign) -> PinLayout
        @discardableResult func after(of: [NSView], aligned: VerticalAlign) -> PinLayout
    #endif

    //
    // MARK: justify / align
    //
    @discardableResult func justify(_: HorizontalAlign) -> FrameToolkit
    @discardableResult func align(_: VerticalAlign) -> FrameToolkit

    //
    // MARK: Width, height and size
    //
    @discardableResult func width(_ width: CGFloat) -> FrameToolkit
    @discardableResult func width(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func width(of view: UIView) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func width(of view: NSView) -> PinLayout
    #endif

    @discardableResult func minWidth(_ width: CGFloat) -> FrameToolkit
    @discardableResult func minWidth(_ percent: Percent) -> FrameToolkit
    @discardableResult func maxWidth(_ width: CGFloat) -> FrameToolkit
    @discardableResult func maxWidth(_ percent: Percent) -> FrameToolkit

    @discardableResult func height(_ height: CGFloat) -> FrameToolkit
    @discardableResult func height(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func height(of view: UIView) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func height(of view: NSView) -> PinLayout
    #endif

    @discardableResult func minHeight(_ height: CGFloat) -> FrameToolkit
    @discardableResult func minHeight(_ percent: Percent) -> FrameToolkit
    @discardableResult func maxHeight(_ height: CGFloat) -> FrameToolkit
    @discardableResult func maxHeight(_ percent: Percent) -> FrameToolkit

    @discardableResult func size(_ size: CGSize) -> FrameToolkit
    @discardableResult func size(_ sideLength: CGFloat) -> FrameToolkit
    @discardableResult func size(_ percent: Percent) -> FrameToolkit
    #if os(iOS) || os(tvOS)
    @discardableResult func size(of view: UIView) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func size(of view: NSView) -> PinLayout
    #endif

    //    @discardableResult func wrapSubViews() -> PinLayout
    //    @discardableResult func wrapSubViews(insets: UIEdgeInsets) -> PinLayout

    /**
     Set the view aspect ratio.

     AspectRatio is applied only if a single dimension (either width or height) can be determined,
     in that case the aspect ratio will be used to compute the other dimension.

     * AspectRatio is defined as the ratio between the width and the height (width / height).
     * An aspect ratio of 2 means the width is twice the size of the height.
     * AspectRatio respects the min (minWidth/minHeight) and the max (maxWidth/maxHeight)
     dimensions of an item.
     */
    @discardableResult func aspectRatio(_ ratio: CGFloat) -> FrameToolkit
    /**
     Set the view aspect ratio using another UIView's aspect ratio.

     AspectRatio is applied only if a single dimension (either width or height) can be determined,
     in that case the aspect ratio will be used to compute the other dimension.

     * AspectRatio is defined as the ratio between the width and the height (width / height).
     * AspectRatio respects the min (minWidth/minHeight) and the max (maxWidth/maxHeight)
     dimensions of an item.
     */
    #if os(iOS) || os(tvOS)
    @discardableResult func aspectRatio(of view: UIView) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func aspectRatio(of view: NSView) -> PinLayout
    #endif

    /**
     If the layouted view is an UIImageView, this method will set the aspectRatio using
     the UIImageView's image dimension.

     For other types of views, this method as no impact.
     */
    #if os(iOS) || os(tvOS)
    @discardableResult func aspectRatio() -> FrameToolkit
    #endif

    /**
     The method adjust the view's size based on the view's `sizeThatFits()` method result.
     PinLayout will adjust either the view's width or height based on the `fitType` parameter value.

     Notes:
     * If margin rules apply, margins will be applied when determining the reference dimension (width/height).
     * The resulting size will always respect `minWidth` / `maxWidth` / `minHeight` / `maxHeight`.

     - Parameter fitType: Identify the reference dimension (width / height) that will be used
     to adjust the view's size:

     .width: The method adjust the view's size based on the **reference width**.
     * If properties related to the width have been pinned (e.g: width, left & right, margins, ...),
     the **reference width will be determined by these properties**, if not the **current view's width**
     will be used.
     * The resulting width will always **match the reference width**.

     .height: The method adjust the view's size based on the **reference height**.
     * If properties related to the height have been pinned (e.g: height, top & bottom, margins, ...),
     the **reference height will be determined by these properties**, if not the **current view's height**
     will be used.
     * The resulting height will always **match the reference height**.

     .widthFlexible: Similar to `.width`, except that PinLayout won't constrain the resulting width to
     match the reference width. The resulting width may be smaller or bigger depending on the view's
     sizeThatFits(..) method result. For example a single line UILabel may returns a smaller width if its
     string is smaller than the reference width.

     .heightFlexible: Similar to `.height`, except that PinLayout won't constrain the resulting height to
     match the reference height. The resulting height may be smaller or bigger depending on the view's
     sizeThatFits(..) method result.

     Examples:

     ```
     // Adjust the view's size based on a width of 100 pixels.
     // The resulting width will always match the pinned property `width(100)`.
     view.pin.width(100).sizeToFit(.width)

     // Adjust the view's size based on view's current width.
     // The resulting width will always match the view's original width.
     // The resulting height will never be bigger than the specified `maxHeight`.
     view.pin.sizeToFit(.width).maxHeight(100)

     // Adjust the view's size based on 100% of the superview's height.
     // The resulting height will always match the pinned property `height(100%)`.
     view.pin.height(100%).sizeToFit(.height)

     // Adjust the view's size based on view's current height.
     // The resulting width will always match the view's original height.
     view.pin.sizeToFit(.height)

     // Since `.widthFlexible` has been specified, its possible that the resulting
     // width will be smaller or bigger than 100 pixels, based of the label's sizeThatFits()
     // method result.
     label.pin.width(100).sizeToFit(.widthFlexible)
     ```
     */
    #if os(iOS) || os(tvOS)
    @discardableResult func sizeToFit(_ fitType: FitType) -> FrameToolkit
    #endif

    #if os(iOS) || os(tvOS)
    @available(*, deprecated, message: "fitSize() is deprecated, please use sizeToFit(fitType: FitType)")
    @discardableResult func fitSize() -> FrameToolkit
    #endif

    //
    // MARK: Margins
    //
    /**
     Set the top margin.
     */
    @discardableResult func marginTop(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginTop(_ percent: Percent) -> FrameToolkit

    /**
     Set the left margin.
     */
    @discardableResult func marginLeft(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginLeft(_ percent: Percent) -> FrameToolkit

    /**
     Set the bottom margin.
     */
    @discardableResult func marginBottom(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginBottom(_ percent: Percent) -> FrameToolkit

    /**
     Set the right margin.
     */
    @discardableResult func marginRight(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginRight(_ percent: Percent) -> FrameToolkit

    // RTL support
    /**
     Set the start margin.

     Depends on the value of `Pin.layoutDirection(...)`:
     * In LTR direction, start margin specify the **left** margin.
     * In RTL direction, start margin specify the **right** margin.
     */
    @discardableResult func marginStart(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginStart(_ percent: Percent) -> FrameToolkit

    /**
     Set the end margin.

     Depends on the value of `Pin.layoutDirection(...)`:
     * In LTR direction, end margin specify the **right** margin.
     * In RTL direction, end margin specify the **left** margin.
     */
    @discardableResult func marginEnd(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginEnd(_ percent: Percent) -> FrameToolkit

    /**
     Set the left, right, start and end margins to the specified value.
     */
    @discardableResult func marginHorizontal(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginHorizontal(_ percent: Percent) -> FrameToolkit

    /**
     Set the top and bottom margins to the specified value.
     */
    @discardableResult func marginVertical(_ value: CGFloat) -> FrameToolkit
    @discardableResult func marginVertical(_ percent: Percent) -> FrameToolkit

    /**
     Set all margins using UIEdgeInsets.
     This method is particularly useful to set all margins using iOS 11 `UIView.safeAreaInsets`.
     */
    #if os(iOS) || os(tvOS)
    @discardableResult func margin(_ insets: UIEdgeInsets) -> FrameToolkit
    #elseif os(macOS)
    @discardableResult func margin(_ insets: NSEdgeInsets) -> PinLayout
    #endif

    /**
     Set margins using NSDirectionalEdgeInsets.
     This method is particularly to set all margins using iOS 11 `UIView.directionalLayoutMargins`.

     Available only on iOS 11 and higher.
     */
    #if os(iOS) || os(tvOS)
    @available(tvOS 11.0, iOS 11.0, *)
    @discardableResult func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FrameToolkit
    #endif

    /**
     Set all margins to the specified value.
     */
    @discardableResult func margin(_ value: CGFloat) -> FrameToolkit
    @discardableResult func margin(_ percent: Percent) -> FrameToolkit

    /**
     Set individually vertical margins (top, bottom) and horizontal margins (left, right, start, end).
     */
    @discardableResult func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FrameToolkit
    @discardableResult func margin(_ vertical: Percent, _ horizontal: Percent) -> FrameToolkit

    /**
     Set individually top, horizontal margins and bottom margin.
     */
    @discardableResult func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FrameToolkit
    @discardableResult func margin(_ top: Percent, _ horizontal: Percent, _ bottom: Percent) -> FrameToolkit

    /**
     Set individually top, left, bottom and right margins.
     */
    @discardableResult func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FrameToolkit
    @discardableResult func margin(_ top: Percent, _ left: Percent, _ bottom: Percent, _ right: Percent) -> FrameToolkit

    /// Normally if only either left or right has been specified, PinLayout will MOVE the view to apply left or right margins.
    /// This is also true even if the width has been set.
    /// Calling pinEdges() will force PinLayout to pin the four edges and then apply left and/or right margins, and this without
    /// moving the view.
    ///
    /// - Returns: PinLayout
    @discardableResult func pinEdges() -> FrameToolkit

    /**
     The method will execute PinLayout commands immediately. This method is **required only if your
     source codes should also work in Xcode Playgrounds**. Outside of playgrounds, PinLayout executes
     this method implicitly, it is not necessary to call it.

     Examples:
     ```swift
     view.pin.top(20).width(100).layout()
     ```
     */
    func layout()
}

/// Horizontal alignment used with relative positionning methods: above(of relativeView:, aligned:), below(of relativeView:, aligned:)
///
/// - left: left aligned
/// - center: center aligned
/// - right: right aligned
@objc public enum HorizontalAlign: Int {
    case left
    case center
    case right
    
    // RTL support
    case start
    case end
}

/// Vertical alignment used with relative positionning methods: left(of relativeView:, aligned:), right(of relativeView:, aligned:)
///
/// - top: top aligned
/// - center: center aligned
/// - bottom: bottom aligned
@objc public enum VerticalAlign: Int {
    case top
    case center
    case bottom
}

/// UIView's horizontal edges (left/right) definition
@objc public protocol HorizontalEdge {
}

/// UIView's vertical edges (top/bottom) definition
@objc public protocol VerticalEdge {
}
    
public enum FitType {
    /**
     **Adjust the view's height** based on the reference width.
     * If properties related to the width have been pinned (e.g: width, left & right, margins),
     the **reference width will be determined by these properties**, else the **current view's width**
     will be used.
     * The resulting width will always **match the reference width**.
    */
    case width
    /**
     **Adjust the view's width** based on the reference height.
     * If properties related to the height have been pinned (e.g: height, top & bottom, margins),
     the reference height will be determined by these properties, else the **current view's height**
     will be used.
     * The resulting height will always **match the reference height*.
     */
    case height

    /**
     Similar to `.width`, except that PinLayout won't constrain the resulting width to
     match the reference width. The resulting width may be smaller of bigger depending on the view's
     sizeThatFits(..) method result. For example a single line UILabel may returns a smaller width if its
     string is smaller than the reference width.
     */
    case widthFlexible
    /**
     Similar to `.height`, except that PinLayout won't constrain the resulting height to
     match the reference height. The resulting height may be smaller of bigger depending on the view's
     sizeThatFits(..) method result.
     */
    case heightFlexible
}

