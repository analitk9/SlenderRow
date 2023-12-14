//
//  SquareView.swift
//  SlenderRow
//
//  Created by Denis Evdokimov on 12/16/23.
//

import SwiftUI

struct SquareView: View {
    @Binding  var isHorizontal: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue)
            .onTapGesture {
                withAnimation {
                    isHorizontal.toggle()
                }
            }
    }
}

#Preview {
    SquareView(isHorizontal: .constant(true))
}
