//
//  TestVIew.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/6.
//

import SwiftUI

struct TestView: View {
  let items = ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape", "Honeydew", "Iced Melon", "Jackfruit", "Kiwi", "Lemon", "Mango", "Nectarine", "Orange", "Peach", "Quince", "Raspberry", "Strawberry", "Tangerine", "Ugli fruit", "Vineyard peach", "Watermelon", "Xigua", "Yellow watermelon", "Zucchini"]

      var body: some View {
          GeometryReader { geometry in
              let columns = Int(geometry.size.width / 120)
              let rows = items.count / columns + (items.count % columns > 0 ? 1 : 0)
              LazyVGrid(columns: Array(repeating: .init(.flexible()), count: columns), spacing: 16) {
                  ForEach(0..<items.count) { index in
                      Text(items[index])
                          .padding(.vertical, 8)
                          .background(Color.blue)
                          .foregroundColor(.white)
                          .cornerRadius(16)
                  }
              }
              .frame(height: CGFloat(rows) * 50)
              .padding(.horizontal, 16)
          }
      }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    TestView()
  }
}
