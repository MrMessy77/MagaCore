//
//  HTSearchHistoryView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/7.
//

import SwiftUI

struct HTSearchHistoryView: View {

  @State var var_history: [String] = ["One Piece", "One", "Piece", "One 11", "Piece"]
  @State var var_populars: [String] = ["Demon Slayer", "My Hero Academia", "Chainsaw Man", "One Piece", "Spy X Family", "Naruto"]

    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        HStack{
          Text("History")
            .font(.system(size: 14))
            .fontWeight(.bold)
          Spacer()
          Button {

          } label: {
            Image("delete")
          }
          .padding(5)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)

        HTFlexibleView(
          data: var_history,
          spacing: 15,
          alignment: .leading
        ) { item in
          HTTagView(var_name: item, var_nameSize: 12, var_padding: EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            .clipShape(Capsule())
        }
        .padding(.horizontal, 15)

        Text("Popular")
          .font(.system(size: 14))
          .fontWeight(.bold)
          .padding(.leading, 15)
          .padding(.top, 20)
          .padding(.bottom, 10)
          .frame(maxWidth: .infinity, alignment: .leading)

        LazyVGrid(columns: [GridItem(.adaptive(minimum: (HTHelper.STATIC_WIDTH - 40) / 2, maximum: .infinity))], spacing: 10) {
          ForEach(0..<var_populars.count, id: \.self) {index in
            let var_color = index < 3 ? "#FF6C3C" : "#999999"
            let var_num: String = index < 9 ? "0\(index+1)" : "\(index+1)"

            HTPopularItem(var_numTitle: var_num, var_numTitleColor: Color(hex: var_color), var_name: self.var_populars[index])
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.top, 10)
          }
        }
        .padding(.horizontal, 15)
      }
      .frame(maxWidth: .infinity)
      .background(Color(hex: "#f5f5f5"))
    }
}

struct HTSearchHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HTSearchHistoryView()
    }
}
