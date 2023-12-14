//
//  Horizontal.swift
//  SlenderRow
//
//  Created by Denis Evdokimov on 12/15/23.
//

import SwiftUI

struct HorizontalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let width = proposal.replacingUnspecifiedDimensions().width
        let viewsCount = CGFloat(subviews.count)
        let spacingTotal = 8.0 * (viewsCount - 1)
        let viewWidth = (width - spacingTotal) / viewsCount
        let viewSize = CGSize(width: viewWidth, height: viewWidth)
        var currentX = bounds.minX + viewWidth / 2
        
        subviews.forEach({ subview in
            let position = CGPoint(x: currentX, y: bounds.midY)
            subview.place(at: position, anchor: .center,proposal: ProposedViewSize(viewSize))
            currentX += viewWidth + spacingTotal / (viewsCount - 1)
        })
    }
    
    
    
    
}
