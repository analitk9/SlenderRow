//
//  Diagonal.swift
//  SlenderRow
//
//  Created by Denis Evdokimov on 12/15/23.
//

import SwiftUI

struct DiagonalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = proposal.replacingUnspecifiedDimensions().width // ширина экрана
        let height = proposal.replacingUnspecifiedDimensions().height //высота экрана
        let viewsCount = CGFloat(subviews.count) // количество вью
        let viewHeight = height / viewsCount // высота квадара чтобы поместиться в экран
        let viewSize = CGSize(width: viewHeight, height: viewHeight)// размер вью чтобы все количество поместилось
        var currentY = bounds.maxY // координаты начала расположения вью
        var currentX = bounds.minX
        
        subviews.forEach({ subview in
            let position = CGPoint(x: currentX, y: currentY)
            subview.place(at: position, anchor: .bottomLeading, proposal: ProposedViewSize(viewSize))
            currentY -= viewHeight // смещаем координату вверх для след вью на высоту вью
            currentX += (width - viewHeight) / (viewsCount - 1)// смещаем вправо координату
        })
    }
}
