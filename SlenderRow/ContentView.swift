//
//  ContentView.swift
//  SlenderRow
//
//  Created by Denis Evdokimov on 12/14/23.
//

import SwiftUI



struct ContentView: View {
    @State var isHorizontal = true
    @State var numberSquares = 7
    var layout: AnyLayout {
        isHorizontal ? AnyLayout(HorizontalLayout()) : AnyLayout(DiagonalLayout())
    }
    var body: some View {
        AnyLayout(layout) {
            ForEach(0..<numberSquares, id:\.self) { _ in
                SquareView(isHorizontal: $isHorizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
