//
//  HTBannerView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTBannerView: View {

  let items = ["", "", "", "", "", ""]
  let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
  @State var currentIndex = 0

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(items, id: \.self) { item in
            HTCoverView()
          }
        }
        .padding(.horizontal, 20)
      }
      .content.offset(x: CGFloat(currentIndex) * -(geometry.size.width / 5))
      .animation(.easeInOut(duration: 0.5))
      .onReceive(timer) { _ in
        currentIndex = (currentIndex + 1) % items.count
      }
    }
  }
}

struct CarouselItemView: View {
  let item: String

  var body: some View {
    RoundedRectangle(cornerRadius: 10)
      .fill(Color.gray)
      .overlay(
        Text(item)
          .foregroundColor(.white)
          .font(.title)
      )
  }
}

struct HTBannerView_Previews: PreviewProvider {
  static var previews: some View {
    HTBannerView()
  }
}
