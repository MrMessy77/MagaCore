//
//  HTSubjectScrollView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTSubjectScrollView: View {

  var var_title: String = ""
  var var_showSeeAll: Bool = false

  var body: some View {
    VStack(spacing: 8){
      HStack{
        Text(var_title)
          .font(.system(size: 16))
          .fontWeight(.bold)
        Spacer()

        if (var_showSeeAll) {
          NavigationLink {
            HTSubjectScreen()
          } label: {
            HStack(spacing: 6){
              Text("See All")
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "#999999"))
              Image("arrow_right")
                .frame(width: 4, height: 8)
            }
          }
        }
      }
      .padding(.horizontal, 15)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 6){
          ForEach(0..<5) { index in
            HTSubjectItem()
          }
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
      }
      .frame(width: HTHelper.STATIC_WIDTH)
    }
  }
}

struct HTSubjectScrollView_Previews: PreviewProvider {
  static var previews: some View {
    HTSubjectScrollView()
  }
}
