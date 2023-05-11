//
//  HTSearchBar.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/5.
//

import SwiftUI

struct HTSearchBar: View {

  var var_placeholder: String = "搜索内容"
  var var_showSearchIcon: Bool = false
  var var_background: Color = Color(hex: "#000000").opacity(0.04)
  var var_barHeight: CGFloat = 36
  @Binding var var_text: String
  @State private var var_offset: CGFloat = .zero    //使用.animation防止报错，iOS15的特性
  @State private var var_isEditing = false

  var body: some View {
    HStack(spacing: 0){
      TextField(var_placeholder, text: $var_text)
        .padding(.horizontal, 15)
        .padding(.leading, var_showSearchIcon ? 18 : 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.system(size: 12))
        .foregroundColor(Color(hex: "#393939"))
        .background(var_background)
        .clipShape(Capsule())
        .overlay(
          HStack {
            //搜索图标
            if (var_showSearchIcon) {
              Image("search")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading, 12)
            }

            Spacer()

            //编辑时显示清除按钮
            if var_isEditing {
              Button(action: {
                self.var_text = ""
              }) {
                Image("search_close")
                  .frame(width: 15, height: 15)
                  .foregroundColor(.gray)
                  .padding(10)
                  .padding(.trailing, 5)
              }
            }
          }
        )
        .onTapGesture {
          self.var_isEditing = true
        }

      // 搜索按钮
      if (var_isEditing) {
        Button(action: {
          self.var_isEditing = false
          self.var_text = ""

          // 收起键盘
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }) {
          Image("search_btn")
            .frame(width: 26, height: 26)
        }
        .padding(.leading, 10)
        .transition(.move(edge: .trailing))
        .animation(.default, value: var_offset)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: var_barHeight)
  }
}

struct HTSearchBarTestView: View {
  @State var var_testText: String = ""

  var body: some View {
    HTSearchBar(var_text: $var_testText)
  }
}

struct HTSearchBar_Previews: PreviewProvider {

  static var previews: some View {
    HTSearchBarTestView()
  }
}
