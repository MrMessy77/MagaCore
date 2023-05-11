//
//  HTSubjectScreen.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/1.
//

import SwiftUI

struct HTSubjectScreen: View {
  var body: some View {
    VStack{
      List(0..<10) { item in
        HTSubjectCell()
          .listRowInsets(EdgeInsets())
      }
      .listStyle(.plain)
      .background(Color.red)
    }
    .navigationTitle("Trending")
  }
}

struct HTSubjectScreen_Previews: PreviewProvider {
  static var previews: some View {
    HTSubjectScreen()
  }
}
