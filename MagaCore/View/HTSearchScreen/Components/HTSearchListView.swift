//
//  HTSearchListView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/7.
//

import SwiftUI

struct HTSearchListView: View {
    var body: some View {
      List(0..<10) { item in
        VStack{
          Text("my hero academia")
            .font(.system(size: 13))
        }
        .listRowBackground(Color.clear)
      }
      .listStyle(.plain)
      .background(Color(hex: "#f5f5f5"))
    }
}

struct HTSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        HTSearchListView()
    }
}
